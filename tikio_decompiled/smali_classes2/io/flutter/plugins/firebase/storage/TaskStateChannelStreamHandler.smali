.class public Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;
.super Ljava/lang/Object;
.source "TaskStateChannelStreamHandler.java"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# instance fields
.field private final TASK_APP_NAME:Ljava/lang/String;

.field private final TASK_SNAPSHOT:Ljava/lang/String;

.field private final TASK_STATE_NAME:Ljava/lang/String;

.field private final androidStorage:Lcom/google/firebase/storage/FirebaseStorage;

.field private final androidTask:Lcom/google/firebase/storage/StorageTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/storage/StorageTask<",
            "*>;"
        }
    .end annotation
.end field

.field private final flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;Lcom/google/firebase/storage/FirebaseStorage;Lcom/google/firebase/storage/StorageTask;)V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "taskState"

    .line 21
    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->TASK_STATE_NAME:Ljava/lang/String;

    const-string v0, "appName"

    .line 22
    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->TASK_APP_NAME:Ljava/lang/String;

    const-string v0, "snapshot"

    .line 23
    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->TASK_SNAPSHOT:Ljava/lang/String;

    .line 29
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    .line 30
    iput-object p2, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidStorage:Lcom/google/firebase/storage/FirebaseStorage;

    .line 31
    iput-object p3, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidTask:Lcom/google/firebase/storage/StorageTask;

    return-void
.end method

.method private getTaskEventMap(Ljava/lang/Object;Ljava/lang/Exception;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Exception;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 100
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidStorage:Lcom/google/firebase/storage/FirebaseStorage;

    invoke-virtual {v1}, Lcom/google/firebase/storage/FirebaseStorage;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "appName"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_0

    .line 102
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->parseTaskSnapshot(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    const-string v1, "snapshot"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p2, :cond_1

    .line 105
    invoke-static {p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getExceptionDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p1

    const-string p2, "error"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method


# virtual methods
.method public synthetic lambda$onListen$0$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/storage/StorageTask$ProvideError;)V
    .locals 2

    .line 38
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p2, v0}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->getTaskEventMap(Ljava/lang/Object;Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    .line 40
    sget-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->RUNNING:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    iget v0, v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->index:I

    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "taskState"

    .line 40
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    .line 44
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->notifyResumeObjects()V

    return-void
.end method

.method public synthetic lambda$onListen$1$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/storage/StorageTask$ProvideError;)V
    .locals 2

    .line 49
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0, p2, v0}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->getTaskEventMap(Ljava/lang/Object;Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    .line 51
    sget-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->PAUSED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    iget v0, v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->index:I

    .line 52
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "taskState"

    .line 51
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    .line 54
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->notifyPauseObjects()V

    return-void
.end method

.method public synthetic lambda$onListen$2$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/storage/StorageTask$ProvideError;)V
    .locals 2

    .line 59
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, p2, v0}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->getTaskEventMap(Ljava/lang/Object;Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    .line 61
    sget-object v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->SUCCESS:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    iget v0, v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->index:I

    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "taskState"

    .line 61
    invoke-interface {p2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    .line 65
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroy()V

    return-void
.end method

.method public synthetic lambda$onListen$3$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 3

    .line 70
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0, v0, v0}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->getTaskEventMap(Ljava/lang/Object;Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object v0

    .line 72
    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->CANCELED:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    iget v1, v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->index:I

    .line 74
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "taskState"

    .line 72
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    invoke-interface {p1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    .line 76
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->notifyCancelObjects()V

    .line 77
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroy()V

    return-void
.end method

.method public synthetic lambda$onListen$4$io-flutter-plugins-firebase-storage-TaskStateChannelStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/Exception;)V
    .locals 3

    .line 82
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, v0, p2}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->getTaskEventMap(Ljava/lang/Object;Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object v0

    .line 84
    sget-object v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->ERROR:Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;

    iget v1, v1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageTaskState;->index:I

    .line 85
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "taskState"

    .line 84
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    const-string v1, "firebase_storage"

    .line 86
    invoke-interface {p1, v1, p2, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 88
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->flutterTask:Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->destroy()V

    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 1

    .line 36
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidTask:Lcom/google/firebase/storage/StorageTask;

    new-instance v0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/storage/StorageTask;->addOnProgressListener(Lcom/google/firebase/storage/OnProgressListener;)Lcom/google/firebase/storage/StorageTask;

    .line 47
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidTask:Lcom/google/firebase/storage/StorageTask;

    new-instance v0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/storage/StorageTask;->addOnPausedListener(Lcom/google/firebase/storage/OnPausedListener;)Lcom/google/firebase/storage/StorageTask;

    .line 57
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidTask:Lcom/google/firebase/storage/StorageTask;

    new-instance v0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/storage/StorageTask;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/firebase/storage/StorageTask;

    .line 68
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidTask:Lcom/google/firebase/storage/StorageTask;

    new-instance v0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/storage/StorageTask;->addOnCanceledListener(Lcom/google/android/gms/tasks/OnCanceledListener;)Lcom/google/firebase/storage/StorageTask;

    .line 80
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;->androidTask:Lcom/google/firebase/storage/StorageTask;

    new-instance v0, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/storage/StorageTask;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/firebase/storage/StorageTask;

    return-void
.end method
