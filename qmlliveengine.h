#pragma once

#include <QFileSystemModel>
#include <QQmlApplicationEngine>
#include <QStringListModel>

class QFileSystemWatcher;
class QTimer;

class DisplayFileSystemModel : public QFileSystemModel
{
    Q_OBJECT
public:
    explicit DisplayFileSystemModel(QObject* parent = nullptr) : QFileSystemModel(parent) { }

    enum Roles {
        SizeRole                       = Qt::UserRole + 4,
        DisplayableFilePermissionsRole = Qt::UserRole + 5,
        LastModifiedRole               = Qt::UserRole + 6,
        UrlStringRole                  = Qt::UserRole + 7
    };
    Q_ENUM(Roles)

    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override
    {
        if (index.isValid() && role >= SizeRole) {
            switch (role) {
            case UrlStringRole:
                return QVariant(QUrl::fromLocalFile(filePath(index)).toString());
            default:
                break;
            }
        }
        return QFileSystemModel::data(index, role);
    }

    QHash<int, QByteArray> roleNames() const override
    {
        QHash<int, QByteArray> result = QFileSystemModel::roleNames();
        return result;
    }
};

class QmlLiveEngine : public QQmlApplicationEngine
{
    Q_OBJECT
public:
    explicit QmlLiveEngine(QObject* parent = nullptr);

    void hotLoad(const QString& mainQml, bool integratedConsole = true);

    Q_INVOKABLE void    clearCache() { clearComponentCache(); }
    Q_INVOKABLE QString getMainQml() { return m_mainQml; };

private slots:
    void onFileSystemChanged();
    void onReloadRequested();

private:
    void watchFileSystemRecursively(const QString& dir);
    void unwatchAll();

    QFileSystemWatcher* m_watcher;
    QTimer*             m_timer;

    QObject*               m_window;
    QString                m_mainQml;
    QString                m_dir;
    DisplayFileSystemModel m_qmlFiles;
};
