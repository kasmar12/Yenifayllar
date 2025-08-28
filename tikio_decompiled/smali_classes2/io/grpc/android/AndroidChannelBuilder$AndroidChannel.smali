.class final Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;
.super Lio/grpc/ManagedChannel;
.source "AndroidChannelBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/android/AndroidChannelBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AndroidChannel"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;,
        Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;
    }
.end annotation


# instance fields
.field private final connectivityManager:Landroid/net/ConnectivityManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final context:Landroid/content/Context;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final delegate:Lio/grpc/ManagedChannel;

.field private final lock:Ljava/lang/Object;

.field private unregisterRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lio/grpc/ManagedChannel;Landroid/content/Context;)V
    .locals 1
    .param p2    # Landroid/content/Context;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0
        }
        names = {
            "delegate",
            "context"
        }
    .end annotation

    .line 189
    invoke-direct {p0}, Lio/grpc/ManagedChannel;-><init>()V

    .line 183
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->lock:Ljava/lang/Object;

    .line 190
    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    .line 191
    iput-object p2, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->context:Landroid/content/Context;

    if-eqz p2, :cond_0

    const-string p1, "connectivity"

    .line 195
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 197
    :try_start_0
    invoke-direct {p0}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->configureNetworkMonitoring()V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "AndroidChannelBuilder"

    const-string v0, "Failed to configure network monitoring. Does app have ACCESS_NETWORK_STATE permission?"

    .line 199
    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 206
    iput-object p1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->connectivityManager:Landroid/net/ConnectivityManager;

    :goto_0
    return-void
.end method

.method static synthetic access$100(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)Landroid/net/ConnectivityManager;
    .locals 0

    .line 176
    iget-object p0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->connectivityManager:Landroid/net/ConnectivityManager;

    return-object p0
.end method

.method static synthetic access$300(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)Landroid/content/Context;
    .locals 0

    .line 176
    iget-object p0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->context:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$400(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;)Lio/grpc/ManagedChannel;
    .locals 0

    .line 176
    iget-object p0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    return-object p0
.end method

.method private configureNetworkMonitoring()V
    .locals 3

    .line 214
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x18

    if-lt v0, v2, :cond_0

    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->connectivityManager:Landroid/net/ConnectivityManager;

    if-eqz v0, :cond_0

    .line 215
    new-instance v0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;

    invoke-direct {v0, p0, v1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;-><init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;Lio/grpc/android/AndroidChannelBuilder$1;)V

    .line 216
    iget-object v1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->connectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1, v0}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 217
    new-instance v1, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$1;

    invoke-direct {v1, p0, v0}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$1;-><init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$DefaultNetworkCallback;)V

    iput-object v1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->unregisterRunnable:Ljava/lang/Runnable;

    goto :goto_0

    .line 226
    :cond_0
    new-instance v0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;

    invoke-direct {v0, p0, v1}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;-><init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;Lio/grpc/android/AndroidChannelBuilder$1;)V

    .line 228
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 230
    iget-object v2, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->context:Landroid/content/Context;

    invoke-virtual {v2, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 231
    new-instance v1, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$2;

    invoke-direct {v1, p0, v0}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$2;-><init>(Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;Lio/grpc/android/AndroidChannelBuilder$AndroidChannel$NetworkReceiver;)V

    iput-object v1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->unregisterRunnable:Ljava/lang/Runnable;

    :goto_0
    return-void
.end method

.method private unregisterNetworkListener()V
    .locals 2

    .line 243
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 244
    :try_start_0
    iget-object v1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->unregisterRunnable:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 245
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    const/4 v1, 0x0

    .line 246
    iput-object v1, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->unregisterRunnable:Ljava/lang/Runnable;

    .line 248
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public authority()Ljava/lang/String;
    .locals 1

    .line 286
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->authority()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 275
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0, p1, p2, p3}, Lio/grpc/ManagedChannel;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1

    return p1
.end method

.method public enterIdle()V
    .locals 1

    .line 306
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->enterIdle()V

    return-void
.end method

.method public getState(Z)Lio/grpc/ConnectivityState;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "requestConnection"
        }
    .end annotation

    .line 291
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0, p1}, Lio/grpc/ManagedChannel;->getState(Z)Lio/grpc/ConnectivityState;

    move-result-object p1

    return-object p1
.end method

.method public isShutdown()Z
    .locals 1

    .line 259
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->isShutdown()Z

    move-result v0

    return v0
.end method

.method public isTerminated()Z
    .locals 1

    .line 264
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->isTerminated()Z

    move-result v0

    return v0
.end method

.method public newCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "methodDescriptor",
            "callOptions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<RequestT:",
            "Ljava/lang/Object;",
            "ResponseT:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/grpc/MethodDescriptor<",
            "TRequestT;TResponseT;>;",
            "Lio/grpc/CallOptions;",
            ")",
            "Lio/grpc/ClientCall<",
            "TRequestT;TResponseT;>;"
        }
    .end annotation

    .line 281
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0, p1, p2}, Lio/grpc/ManagedChannel;->newCall(Lio/grpc/MethodDescriptor;Lio/grpc/CallOptions;)Lio/grpc/ClientCall;

    move-result-object p1

    return-object p1
.end method

.method public notifyWhenStateChanged(Lio/grpc/ConnectivityState;Ljava/lang/Runnable;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "source",
            "callback"
        }
    .end annotation

    .line 296
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0, p1, p2}, Lio/grpc/ManagedChannel;->notifyWhenStateChanged(Lio/grpc/ConnectivityState;Ljava/lang/Runnable;)V

    return-void
.end method

.method public resetConnectBackoff()V
    .locals 1

    .line 301
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->resetConnectBackoff()V

    return-void
.end method

.method public shutdown()Lio/grpc/ManagedChannel;
    .locals 1

    .line 253
    invoke-direct {p0}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->unregisterNetworkListener()V

    .line 254
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->shutdown()Lio/grpc/ManagedChannel;

    move-result-object v0

    return-object v0
.end method

.method public shutdownNow()Lio/grpc/ManagedChannel;
    .locals 1

    .line 269
    invoke-direct {p0}, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->unregisterNetworkListener()V

    .line 270
    iget-object v0, p0, Lio/grpc/android/AndroidChannelBuilder$AndroidChannel;->delegate:Lio/grpc/ManagedChannel;

    invoke-virtual {v0}, Lio/grpc/ManagedChannel;->shutdownNow()Lio/grpc/ManagedChannel;

    move-result-object v0

    return-object v0
.end method
