#include "qmlliveengine.h"
#include <QFileInfo>
#include <QTimer>
#include <QFileSystemWatcher>
#include <QQmlContext>
#include <QDir>

QmlLiveEngine::QmlLiveEngine(QObject* parent) :
    QQmlApplicationEngine(parent), m_watcher(nullptr), m_timer(nullptr), m_window(nullptr)
{
    qmlRegisterUncreatableType<DisplayFileSystemModel>(
            "io.qt.examples.quick.controls.filesystembrowser", 1, 0, "FileSystemModel",
            "Cannot create a FileSystemModel instance.");
}

void QmlLiveEngine::hotLoad(const QString &mainQml, bool integratedConsole)
{
    m_mainQml = mainQml;
    m_dir = m_mainQml.left(m_mainQml.lastIndexOf('/'));

    m_watcher = new QFileSystemWatcher(this);
    m_timer   = new QTimer(this);

    m_qmlFiles.setRootPath(m_dir);
    m_qmlFiles.setNameFilterDisables(false);
    m_qmlFiles.setNameFilters({ "*.qml" });
    watchFileSystemRecursively(m_dir);

    m_timer->setInterval(500);
    m_timer->setSingleShot(true);

    connect(m_watcher, &QFileSystemWatcher::directoryChanged, this
        , &QmlLiveEngine::onFileSystemChanged);
    connect(m_watcher, &QFileSystemWatcher::fileChanged, this
        , &QmlLiveEngine::onFileSystemChanged);
    connect(m_timer, &QTimer::timeout, this, &QmlLiveEngine::onReloadRequested);

    rootContext()->setContextProperty("QmlLiveEngine", this);
    rootContext()->setContextProperty("QmlDir", m_dir);
    rootContext()->setContextProperty("fileSystemModel", &m_qmlFiles);
    rootContext()->setContextProperty("rootPathIndex", m_qmlFiles.index(m_qmlFiles.rootPath()));

    load(mainQml);

    m_window = rootObjects().first();
}

void QmlLiveEngine::onFileSystemChanged()
{
    if (!m_timer) return;
    if (!m_timer->isActive()) m_timer->start();
}

void QmlLiveEngine::onReloadRequested()
{

    unwatchAll();
    watchFileSystemRecursively(m_dir);

    if (m_window) {
        QMetaObject::invokeMethod(m_window, "_reload");
    }
}

void QmlLiveEngine::watchFileSystemRecursively(const QString &dir)
{
    QDir d(dir);
    QStringList files = d.entryList(QStringList() << "*.qml", QDir::Files);
    QStringList dirs = d.entryList(QDir::Dirs | QDir::NoDotAndDotDot);

    m_watcher->addPath(dir);
    for (QString& file : files) {
        m_watcher->addPath(dir + '/' + file);
    }

    for (QString& subdir : dirs) {
        watchFileSystemRecursively(dir + '/' + subdir);
    }
}

void QmlLiveEngine::unwatchAll()
{
    QStringList dirs = m_watcher->directories();
    QStringList files = m_watcher->files();
    QStringList fails;

    for (QString &dir: dirs) {
        if (!m_watcher->removePath(dir)) {
            fails << dir;
        }
    }
    for (QString &file: files) {
        if (!m_watcher->removePath(file)) {
            fails << file;
        }
    }

    if (!fails.empty()) {
        qWarning() << tr("The following directories or files "
                         "cannot be removed from file system watcher:");
        for (QString &fail: fails) {
            qWarning() << "\t" << fail;
        }
    }
}

