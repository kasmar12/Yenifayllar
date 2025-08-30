.class public Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;
.super Lio/flutter/plugins/firebase/messaging/JobIntentService;
.source "FlutterFirebaseMessagingBackgroundService.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "FLTFireMsgService"

.field private static flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

.field private static final messagingQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 24
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->messagingQueue:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lio/flutter/plugins/firebase/messaging/JobIntentService;-><init>()V

    return-void
.end method

.method public static enqueueMessageProcessing(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 34
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Landroid/os/Bundle;

    const-string v1, "notification"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/messaging/RemoteMessage;

    .line 37
    const-class v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;

    const/16 v2, 0x7e4

    .line 42
    invoke-virtual {v0}, Lcom/google/firebase/messaging/RemoteMessage;->getOriginalPriority()I

    move-result v0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 37
    :goto_0
    invoke-static {p0, v1, v2, p1, v3}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->enqueueWork(Landroid/content/Context;Ljava/lang/Class;ILandroid/content/Intent;Z)V

    return-void
.end method

.method static synthetic lambda$onHandleWork$0(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V
    .locals 1

    .line 149
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    invoke-virtual {v0, p0, p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->executeDartCallbackInBackgroundIsolate(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V

    return-void
.end method

.method static onInitialized()V
    .locals 5

    const-string v0, "FLTFireMsgService"

    const-string v1, "FlutterFirebaseMessagingBackgroundService started!"

    .line 76
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->messagingQueue:Ljava/util/List;

    monitor-enter v0

    .line 80
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;

    .line 81
    sget-object v3, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->executeDartCallbackInBackgroundIsolate(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V

    goto :goto_0

    .line 83
    :cond_0
    sget-object v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->messagingQueue:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 84
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static setCallbackDispatcher(J)V
    .locals 0

    .line 92
    invoke-static {p0, p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->setCallbackDispatcher(J)V

    return-void
.end method

.method public static setUserCallbackHandle(J)V
    .locals 0

    .line 100
    invoke-static {p0, p1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->setUserCallbackHandle(J)V

    return-void
.end method

.method public static startBackgroundIsolate(JLio/flutter/embedding/engine/FlutterShellArgs;)V
    .locals 1

    .line 59
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    if-eqz v0, :cond_0

    const-string p0, "FLTFireMsgService"

    const-string p1, "Attempted to start a duplicate background isolate. Returning..."

    .line 60
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 63
    :cond_0
    new-instance v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    .line 64
    invoke-virtual {v0, p0, p1, p2}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->startBackgroundIsolate(JLio/flutter/embedding/engine/FlutterShellArgs;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic isStopped()Z
    .locals 1

    .line 20
    invoke-super {p0}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->isStopped()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    .line 20
    invoke-super {p0, p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->onBind(Landroid/content/Intent;)Landroid/os/IBinder;

    move-result-object p1

    return-object p1
.end method

.method public onCreate()V
    .locals 1

    .line 105
    invoke-super {p0}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->onCreate()V

    .line 106
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    .line 109
    :cond_0
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->startBackgroundIsolate()V

    return-void
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 20
    invoke-super {p0}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->onDestroy()V

    return-void
.end method

.method protected onHandleWork(Landroid/content/Intent;)V
    .locals 3

    .line 127
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isDartBackgroundHandlerRegistered()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "FLTFireMsgService"

    const-string v0, "A background message could not be handled in Dart as no onBackgroundMessage handler has been registered."

    .line 128
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 136
    :cond_0
    sget-object v0, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->messagingQueue:Ljava/util/List;

    monitor-enter v0

    .line 137
    :try_start_0
    sget-object v1, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->flutterBackgroundExecutor:Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundExecutor;->isNotRunning()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "FLTFireMsgService"

    const-string v2, "Service has not yet started, messages will be queued."

    .line 138
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    monitor-exit v0

    return-void

    .line 142
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 147
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, v0}, Lio/flutter/plugins/firebase/messaging/FlutterFirebaseMessagingBackgroundService$$ExternalSyntheticLambda0;-><init>(Landroid/content/Intent;Ljava/util/concurrent/CountDownLatch;)V

    .line 148
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 152
    :try_start_1
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "FLTFireMsgService"

    const-string v1, "Exception waiting to execute Dart callback"

    .line 154
    invoke-static {v0, v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    .line 142
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public bridge synthetic onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    .line 20
    invoke-super {p0, p1, p2, p3}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->onStartCommand(Landroid/content/Intent;II)I

    move-result p1

    return p1
.end method

.method public bridge synthetic onStopCurrentWork()Z
    .locals 1

    .line 20
    invoke-super {p0}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->onStopCurrentWork()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setInterruptIfStopped(Z)V
    .locals 0

    .line 20
    invoke-super {p0, p1}, Lio/flutter/plugins/firebase/messaging/JobIntentService;->setInterruptIfStopped(Z)V

    return-void
.end method
