.class Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;
.super Ljava/lang/Object;
.source "FlutterFirebaseStorageTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;
    }
.end annotation


# static fields
.field static final inProgressTasks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bytes:[B

.field private final cancelSyncObject:Ljava/lang/Object;

.field private destroyed:Ljava/lang/Boolean;

.field private final fileUri:Landroid/net/Uri;

.field private final handle:I

.field private final metadata:Lcom/google/firebase/storage/StorageMetadata;

.field private final pauseSyncObject:Ljava/lang/Object;

.field private final reference:Lcom/google/firebase/storage/StorageReference;

.field private final resumeSyncObject:Ljava/lang/Object;

.field private storageTask:Lcom/google/firebase/storage/StorageTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/storage/StorageTask<",
            "*>;"
        }
    .end annotation
.end field

.field private final type:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->inProgressTasks:Landroid/util/SparseArray;

    return-void
.end method

.method private constructor <init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;ILcom/google/firebase/storage/StorageReference;[BLandroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->pauseSyncObject:Ljava/lang/Object;

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->resumeSyncObject:Ljava/lang/Object;

    .line 35
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelSyncObject:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 37
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroyed:Ljava/lang/Boolean;

    .line 46
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->type:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    .line 47
    iput p2, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->handle:I

    .line 48
    iput-object p3, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    .line 49
    iput-object p4, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->bytes:[B

    .line 50
    iput-object p5, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->fileUri:Landroid/net/Uri;

    .line 51
    iput-object p6, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->metadata:Lcom/google/firebase/storage/StorageMetadata;

    .line 52
    sget-object p1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->inProgressTasks:Landroid/util/SparseArray;

    monitor-enter p1

    .line 53
    :try_start_0
    invoke-virtual {p1, p2, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 54
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method static cancelInProgressTasks()V
    .locals 4

    .line 65
    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->inProgressTasks:Landroid/util/SparseArray;

    monitor-enter v0

    const/4 v1, 0x0

    .line 66
    :goto_0
    :try_start_0
    sget-object v2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->inProgressTasks:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 68
    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    if-eqz v2, :cond_0

    .line 70
    invoke-virtual {v2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroy()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 75
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static downloadFile(ILcom/google/firebase/storage/StorageReference;Ljava/io/File;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;
    .locals 8

    .line 95
    new-instance v7, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->DOWNLOAD:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    .line 96
    invoke-static {p2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v0, v7

    move v2, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v6}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;ILcom/google/firebase/storage/StorageReference;[BLandroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)V

    return-object v7
.end method

.method static getInProgressTaskForHandle(I)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;
    .locals 1

    .line 59
    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->inProgressTasks:Landroid/util/SparseArray;

    monitor-enter v0

    .line 60
    :try_start_0
    invoke-virtual {v0, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 61
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static parseDownloadTaskSnapshot(Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 113
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getStorage()Lcom/google/firebase/storage/StorageReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageReference;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "path"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getTask()Lcom/google/firebase/storage/StorageTask;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageTask;->isSuccessful()Z

    move-result v1

    const-string v2, "bytesTransferred"

    if-eqz v1, :cond_0

    .line 118
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getTotalByteCount()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getBytesTransferred()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :goto_0
    invoke-virtual {p0}, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;->getTotalByteCount()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const-string v1, "totalBytes"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method static parseTaskSnapshot(Ljava/lang/Object;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 127
    instance-of v0, p0, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;

    if-eqz v0, :cond_0

    .line 128
    check-cast p0, Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;

    invoke-static {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->parseDownloadTaskSnapshot(Lcom/google/firebase/storage/FileDownloadTask$TaskSnapshot;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 130
    :cond_0
    check-cast p0, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;

    invoke-static {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->parseUploadTaskSnapshot(Lcom/google/firebase/storage/UploadTask$TaskSnapshot;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static parseUploadTaskSnapshot(Lcom/google/firebase/storage/UploadTask$TaskSnapshot;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/storage/UploadTask$TaskSnapshot;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 101
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getStorage()Lcom/google/firebase/storage/StorageReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageReference;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "path"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getBytesTransferred()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "bytesTransferred"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getTotalByteCount()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "totalBytes"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getMetadata()Lcom/google/firebase/storage/StorageMetadata;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 105
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;->getMetadata()Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p0

    invoke-static {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->parseMetadataToMap(Lcom/google/firebase/storage/StorageMetadata;)Ljava/util/Map;

    move-result-object p0

    const-string v1, "metadata"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public static uploadBytes(ILcom/google/firebase/storage/StorageReference;[BLcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;
    .locals 8

    .line 80
    new-instance v7, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->BYTES:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const/4 v5, 0x0

    move-object v0, v7

    move v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;ILcom/google/firebase/storage/StorageReference;[BLandroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)V

    return-object v7
.end method

.method public static uploadFile(ILcom/google/firebase/storage/StorageReference;Landroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;
    .locals 8

    .line 89
    new-instance v7, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->FILE:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    const/4 v4, 0x0

    move-object v0, v7

    move v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;ILcom/google/firebase/storage/StorageReference;[BLandroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)V

    return-object v7
.end method


# virtual methods
.method destroy()V
    .locals 2

    .line 135
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroyed:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 136
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroyed:Ljava/lang/Boolean;

    .line 138
    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->inProgressTasks:Landroid/util/SparseArray;

    monitor-enter v0

    .line 139
    :try_start_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageTask;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageTask;->isPaused()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 140
    :cond_1
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageTask;->cancel()Z

    .line 142
    :cond_2
    iget v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->handle:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 143
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 145
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelSyncObject:Ljava/lang/Object;

    monitor-enter v1

    .line 146
    :try_start_1
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelSyncObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 147
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 149
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->pauseSyncObject:Ljava/lang/Object;

    monitor-enter v0

    .line 150
    :try_start_2
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->pauseSyncObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 151
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 153
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->resumeSyncObject:Ljava/lang/Object;

    monitor-enter v1

    .line 154
    :try_start_3
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->resumeSyncObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 155
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    .line 151
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1

    :catchall_2
    move-exception v0

    .line 147
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v0

    :catchall_3
    move-exception v1

    .line 143
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v1
.end method

.method public getAndroidTask()Lcom/google/firebase/storage/StorageTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/firebase/storage/StorageTask<",
            "*>;"
        }
    .end annotation

    .line 208
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    return-object v0
.end method

.method public getSnapshot()Ljava/lang/Object;
    .locals 1

    .line 182
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageTask;->getSnapshot()Lcom/google/firebase/storage/StorageTask$ProvideError;

    move-result-object v0

    return-object v0
.end method

.method public isDestroyed()Z
    .locals 1

    .line 186
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroyed:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public notifyCancelObjects()V
    .locals 2

    .line 196
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelSyncObject:Ljava/lang/Object;

    monitor-enter v0

    .line 197
    :try_start_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelSyncObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 198
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public notifyPauseObjects()V
    .locals 2

    .line 202
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->pauseSyncObject:Ljava/lang/Object;

    monitor-enter v0

    .line 203
    :try_start_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->pauseSyncObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 204
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public notifyResumeObjects()V
    .locals 2

    .line 190
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->resumeSyncObject:Ljava/lang/Object;

    monitor-enter v0

    .line 191
    :try_start_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->resumeSyncObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 192
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method startTaskWithMethodChannel(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 160
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->type:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->BYTES:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->bytes:[B

    if-eqz p1, :cond_1

    .line 161
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->metadata:Lcom/google/firebase/storage/StorageMetadata;

    if-nez v0, :cond_0

    .line 162
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v0, p1}, Lcom/google/firebase/storage/StorageReference;->putBytes([B)Lcom/google/firebase/storage/UploadTask;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    goto :goto_0

    .line 164
    :cond_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v1, p1, v0}, Lcom/google/firebase/storage/StorageReference;->putBytes([BLcom/google/firebase/storage/StorageMetadata;)Lcom/google/firebase/storage/UploadTask;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    goto :goto_0

    .line 166
    :cond_1
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->type:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->FILE:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->fileUri:Landroid/net/Uri;

    if-eqz p1, :cond_3

    .line 167
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->metadata:Lcom/google/firebase/storage/StorageMetadata;

    if-nez v0, :cond_2

    .line 168
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v0, p1}, Lcom/google/firebase/storage/StorageReference;->putFile(Landroid/net/Uri;)Lcom/google/firebase/storage/UploadTask;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    goto :goto_0

    .line 170
    :cond_2
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v1, p1, v0}, Lcom/google/firebase/storage/StorageReference;->putFile(Landroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)Lcom/google/firebase/storage/UploadTask;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    goto :goto_0

    .line 172
    :cond_3
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->type:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;->DOWNLOAD:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask$FlutterFirebaseStorageTaskType;

    if-ne p1, v0, :cond_4

    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->fileUri:Landroid/net/Uri;

    if-eqz p1, :cond_4

    .line 173
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v0, p1}, Lcom/google/firebase/storage/StorageReference;->getFile(Landroid/net/Uri;)Lcom/google/firebase/storage/FileDownloadTask;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    .line 178
    :goto_0
    new-instance p1, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->reference:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageReference;->getStorage()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->storageTask:Lcom/google/firebase/storage/StorageTask;

    invoke-direct {p1, p0, v0, v1}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;Lcom/google/firebase/storage/FirebaseStorage;Lcom/google/firebase/storage/StorageTask;)V

    return-object p1

    .line 175
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Unable to start task. Some arguments have no been initialized."

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method
