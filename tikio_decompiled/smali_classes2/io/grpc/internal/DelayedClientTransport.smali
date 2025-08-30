.class final Lio/grpc/internal/DelayedClientTransport;
.super Ljava/lang/Object;
.source "DelayedClientTransport.java"

# interfaces
.implements Lio/grpc/internal/ManagedClientTransport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/grpc/internal/DelayedClientTransport$PendingStream;
    }
.end annotation


# instance fields
.field private final defaultAppExecutor:Ljava/util/concurrent/Executor;

.field private lastPicker:Lio/grpc/LoadBalancer$SubchannelPicker;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private lastPickerVersion:J

.field private listener:Lio/grpc/internal/ManagedClientTransport$Listener;

.field private final lock:Ljava/lang/Object;

.field private final logId:Lio/grpc/InternalLogId;

.field private pendingStreams:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lio/grpc/internal/DelayedClientTransport$PendingStream;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private reportTransportInUse:Ljava/lang/Runnable;

.field private reportTransportNotInUse:Ljava/lang/Runnable;

.field private reportTransportTerminated:Ljava/lang/Runnable;

.field private shutdownStatus:Lio/grpc/Status;

.field private final syncContext:Lio/grpc/SynchronizationContext;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Lio/grpc/SynchronizationContext;)V
    .locals 2

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const-class v0, Lio/grpc/internal/DelayedClientTransport;

    const/4 v1, 0x0

    .line 56
    invoke-static {v0, v1}, Lio/grpc/InternalLogId;->allocate(Ljava/lang/Class;Ljava/lang/String;)Lio/grpc/InternalLogId;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->logId:Lio/grpc/InternalLogId;

    .line 58
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    .line 68
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    .line 100
    iput-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->defaultAppExecutor:Ljava/util/concurrent/Executor;

    .line 101
    iput-object p2, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    return-void
.end method

.method static synthetic access$100(Lio/grpc/internal/DelayedClientTransport;)Lio/grpc/internal/ManagedClientTransport$Listener;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->listener:Lio/grpc/internal/ManagedClientTransport$Listener;

    return-object p0
.end method

.method static synthetic access$1000(Lio/grpc/internal/DelayedClientTransport;)Lio/grpc/Status;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->shutdownStatus:Lio/grpc/Status;

    return-object p0
.end method

.method static synthetic access$500(Lio/grpc/internal/DelayedClientTransport;)Ljava/lang/Object;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$600(Lio/grpc/internal/DelayedClientTransport;)Ljava/lang/Runnable;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$602(Lio/grpc/internal/DelayedClientTransport;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    .line 53
    iput-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$700(Lio/grpc/internal/DelayedClientTransport;)Ljava/util/Collection;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    return-object p0
.end method

.method static synthetic access$800(Lio/grpc/internal/DelayedClientTransport;)Ljava/lang/Runnable;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportNotInUse:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$900(Lio/grpc/internal/DelayedClientTransport;)Lio/grpc/SynchronizationContext;
    .locals 0

    .line 53
    iget-object p0, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    return-object p0
.end method

.method private createPendingStream(Lio/grpc/LoadBalancer$PickSubchannelArgs;[Lio/grpc/ClientStreamTracer;)Lio/grpc/internal/DelayedClientTransport$PendingStream;
    .locals 2

    .line 181
    new-instance v0, Lio/grpc/internal/DelayedClientTransport$PendingStream;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lio/grpc/internal/DelayedClientTransport$PendingStream;-><init>(Lio/grpc/internal/DelayedClientTransport;Lio/grpc/LoadBalancer$PickSubchannelArgs;[Lio/grpc/ClientStreamTracer;Lio/grpc/internal/DelayedClientTransport$1;)V

    .line 182
    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 183
    invoke-virtual {p0}, Lio/grpc/internal/DelayedClientTransport;->getPendingStreamsCount()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 184
    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    iget-object p2, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportInUse:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Lio/grpc/SynchronizationContext;->executeLater(Ljava/lang/Runnable;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public getLogId()Lio/grpc/InternalLogId;
    .locals 1

    .line 348
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->logId:Lio/grpc/InternalLogId;

    return-object v0
.end method

.method final getPendingStreamsCount()I
    .locals 2

    .line 269
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 270
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 271
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getStats()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Lio/grpc/InternalChannelz$SocketStats;",
            ">;"
        }
    .end annotation

    .line 196
    invoke-static {}, Lcom/google/common/util/concurrent/SettableFuture;->create()Lcom/google/common/util/concurrent/SettableFuture;

    move-result-object v0

    const/4 v1, 0x0

    .line 197
    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/SettableFuture;->set(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final hasPendingStreams()Z
    .locals 2

    .line 262
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 263
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 264
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public final newStream(Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/CallOptions;[Lio/grpc/ClientStreamTracer;)Lio/grpc/internal/ClientStream;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/grpc/MethodDescriptor<",
            "**>;",
            "Lio/grpc/Metadata;",
            "Lio/grpc/CallOptions;",
            "[",
            "Lio/grpc/ClientStreamTracer;",
            ")",
            "Lio/grpc/internal/ClientStream;"
        }
    .end annotation

    .line 140
    :try_start_0
    new-instance v0, Lio/grpc/internal/PickSubchannelArgsImpl;

    invoke-direct {v0, p1, p2, p3}, Lio/grpc/internal/PickSubchannelArgsImpl;-><init>(Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/CallOptions;)V

    const/4 p1, 0x0

    const-wide/16 v1, -0x1

    .line 144
    :goto_0
    iget-object p2, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 145
    :try_start_1
    iget-object v3, p0, Lio/grpc/internal/DelayedClientTransport;->shutdownStatus:Lio/grpc/Status;

    if-eqz v3, :cond_0

    .line 146
    new-instance p1, Lio/grpc/internal/FailingClientStream;

    iget-object p3, p0, Lio/grpc/internal/DelayedClientTransport;->shutdownStatus:Lio/grpc/Status;

    invoke-direct {p1, p3, p4}, Lio/grpc/internal/FailingClientStream;-><init>(Lio/grpc/Status;[Lio/grpc/ClientStreamTracer;)V

    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    :goto_1
    iget-object p2, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {p2}, Lio/grpc/SynchronizationContext;->drain()V

    return-object p1

    .line 148
    :cond_0
    :try_start_2
    iget-object v3, p0, Lio/grpc/internal/DelayedClientTransport;->lastPicker:Lio/grpc/LoadBalancer$SubchannelPicker;

    if-nez v3, :cond_1

    .line 149
    invoke-direct {p0, v0, p4}, Lio/grpc/internal/DelayedClientTransport;->createPendingStream(Lio/grpc/LoadBalancer$PickSubchannelArgs;[Lio/grpc/ClientStreamTracer;)Lio/grpc/internal/DelayedClientTransport$PendingStream;

    move-result-object p1

    monitor-exit p2

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    .line 152
    iget-wide v4, p0, Lio/grpc/internal/DelayedClientTransport;->lastPickerVersion:J

    cmp-long p1, v1, v4

    if-nez p1, :cond_2

    .line 153
    invoke-direct {p0, v0, p4}, Lio/grpc/internal/DelayedClientTransport;->createPendingStream(Lio/grpc/LoadBalancer$PickSubchannelArgs;[Lio/grpc/ClientStreamTracer;)Lio/grpc/internal/DelayedClientTransport$PendingStream;

    move-result-object p1

    monitor-exit p2

    goto :goto_1

    .line 156
    :cond_2
    iget-wide v1, p0, Lio/grpc/internal/DelayedClientTransport;->lastPickerVersion:J

    .line 157
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 158
    :try_start_3
    invoke-virtual {v3, v0}, Lio/grpc/LoadBalancer$SubchannelPicker;->pickSubchannel(Lio/grpc/LoadBalancer$PickSubchannelArgs;)Lio/grpc/LoadBalancer$PickResult;

    move-result-object p1

    .line 160
    invoke-virtual {p3}, Lio/grpc/CallOptions;->isWaitForReady()Z

    move-result p2

    .line 159
    invoke-static {p1, p2}, Lio/grpc/internal/GrpcUtil;->getTransportFromPickResult(Lio/grpc/LoadBalancer$PickResult;Z)Lio/grpc/internal/ClientTransport;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 163
    invoke-virtual {v0}, Lio/grpc/LoadBalancer$PickSubchannelArgs;->getMethodDescriptor()Lio/grpc/MethodDescriptor;

    move-result-object p2

    invoke-virtual {v0}, Lio/grpc/LoadBalancer$PickSubchannelArgs;->getHeaders()Lio/grpc/Metadata;

    move-result-object p3

    invoke-virtual {v0}, Lio/grpc/LoadBalancer$PickSubchannelArgs;->getCallOptions()Lio/grpc/CallOptions;

    move-result-object v0

    .line 162
    invoke-interface {p1, p2, p3, v0, p4}, Lio/grpc/internal/ClientTransport;->newStream(Lio/grpc/MethodDescriptor;Lio/grpc/Metadata;Lio/grpc/CallOptions;[Lio/grpc/ClientStreamTracer;)Lio/grpc/internal/ClientStream;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :cond_3
    move-object p1, v3

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 157
    :try_start_4
    monitor-exit p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    .line 170
    iget-object p2, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {p2}, Lio/grpc/SynchronizationContext;->drain()V

    throw p1
.end method

.method public final ping(Lio/grpc/internal/ClientTransport$PingCallback;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 191
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "This method is not expected to be called"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method final reprocess(Lio/grpc/LoadBalancer$SubchannelPicker;)V
    .locals 7
    .param p1    # Lio/grpc/LoadBalancer$SubchannelPicker;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 286
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 287
    :try_start_0
    iput-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->lastPicker:Lio/grpc/LoadBalancer$SubchannelPicker;

    .line 288
    iget-wide v1, p0, Lio/grpc/internal/DelayedClientTransport;->lastPickerVersion:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lio/grpc/internal/DelayedClientTransport;->lastPickerVersion:J

    if-eqz p1, :cond_8

    .line 289
    invoke-virtual {p0}, Lio/grpc/internal/DelayedClientTransport;->hasPendingStreams()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_1

    .line 292
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 293
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 294
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 296
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/grpc/internal/DelayedClientTransport$PendingStream;

    .line 297
    invoke-static {v2}, Lio/grpc/internal/DelayedClientTransport$PendingStream;->access$300(Lio/grpc/internal/DelayedClientTransport$PendingStream;)Lio/grpc/LoadBalancer$PickSubchannelArgs;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/grpc/LoadBalancer$SubchannelPicker;->pickSubchannel(Lio/grpc/LoadBalancer$PickSubchannelArgs;)Lio/grpc/LoadBalancer$PickResult;

    move-result-object v3

    .line 298
    invoke-static {v2}, Lio/grpc/internal/DelayedClientTransport$PendingStream;->access$300(Lio/grpc/internal/DelayedClientTransport$PendingStream;)Lio/grpc/LoadBalancer$PickSubchannelArgs;

    move-result-object v4

    invoke-virtual {v4}, Lio/grpc/LoadBalancer$PickSubchannelArgs;->getCallOptions()Lio/grpc/CallOptions;

    move-result-object v4

    .line 300
    invoke-virtual {v4}, Lio/grpc/CallOptions;->isWaitForReady()Z

    move-result v5

    .line 299
    invoke-static {v3, v5}, Lio/grpc/internal/GrpcUtil;->getTransportFromPickResult(Lio/grpc/LoadBalancer$PickResult;Z)Lio/grpc/internal/ClientTransport;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 302
    iget-object v5, p0, Lio/grpc/internal/DelayedClientTransport;->defaultAppExecutor:Ljava/util/concurrent/Executor;

    .line 306
    invoke-virtual {v4}, Lio/grpc/CallOptions;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 307
    invoke-virtual {v4}, Lio/grpc/CallOptions;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v5

    .line 309
    :cond_2
    invoke-static {v2, v3}, Lio/grpc/internal/DelayedClientTransport$PendingStream;->access$400(Lio/grpc/internal/DelayedClientTransport$PendingStream;Lio/grpc/internal/ClientTransport;)Ljava/lang/Runnable;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 311
    invoke-interface {v5, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 313
    :cond_3
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 317
    :cond_4
    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter p1

    .line 321
    :try_start_1
    invoke-virtual {p0}, Lio/grpc/internal/DelayedClientTransport;->hasPendingStreams()Z

    move-result v1

    if-nez v1, :cond_5

    .line 322
    monitor-exit p1

    return-void

    .line 324
    :cond_5
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    .line 327
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 328
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    .line 330
    :cond_6
    invoke-virtual {p0}, Lio/grpc/internal/DelayedClientTransport;->hasPendingStreams()Z

    move-result v0

    if-nez v0, :cond_7

    .line 336
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportNotInUse:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lio/grpc/SynchronizationContext;->executeLater(Ljava/lang/Runnable;)V

    .line 337
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->shutdownStatus:Lio/grpc/Status;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    if-eqz v0, :cond_7

    .line 338
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {v1, v0}, Lio/grpc/SynchronizationContext;->executeLater(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    .line 339
    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    .line 342
    :cond_7
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 343
    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {p1}, Lio/grpc/SynchronizationContext;->drain()V

    return-void

    :catchall_0
    move-exception v0

    .line 342
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 290
    :cond_8
    :goto_1
    :try_start_3
    monitor-exit v0

    return-void

    :catchall_1
    move-exception p1

    .line 293
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public final shutdown(Lio/grpc/Status;)V
    .locals 3

    .line 208
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 209
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->shutdownStatus:Lio/grpc/Status;

    if-eqz v1, :cond_0

    .line 210
    monitor-exit v0

    return-void

    .line 212
    :cond_0
    iput-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->shutdownStatus:Lio/grpc/Status;

    .line 213
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    new-instance v2, Lio/grpc/internal/DelayedClientTransport$4;

    invoke-direct {v2, p0, p1}, Lio/grpc/internal/DelayedClientTransport$4;-><init>(Lio/grpc/internal/DelayedClientTransport;Lio/grpc/Status;)V

    invoke-virtual {v1, v2}, Lio/grpc/SynchronizationContext;->executeLater(Ljava/lang/Runnable;)V

    .line 219
    invoke-virtual {p0}, Lio/grpc/internal/DelayedClientTransport;->hasPendingStreams()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    if-eqz p1, :cond_1

    .line 220
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {v1, p1}, Lio/grpc/SynchronizationContext;->executeLater(Ljava/lang/Runnable;)V

    const/4 p1, 0x0

    .line 221
    iput-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    .line 223
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 224
    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {p1}, Lio/grpc/SynchronizationContext;->drain()V

    return-void

    :catchall_0
    move-exception p1

    .line 223
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final shutdownNow(Lio/grpc/Status;)V
    .locals 6

    .line 233
    invoke-virtual {p0, p1}, Lio/grpc/internal/DelayedClientTransport;->shutdown(Lio/grpc/Status;)V

    .line 236
    iget-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 237
    :try_start_0
    iget-object v1, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    .line 238
    iget-object v2, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    const/4 v3, 0x0

    .line 239
    iput-object v3, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    .line 240
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 241
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lio/grpc/internal/DelayedClientTransport;->pendingStreams:Ljava/util/Collection;

    .line 243
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_3

    .line 245
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/grpc/internal/DelayedClientTransport$PendingStream;

    .line 246
    new-instance v3, Lio/grpc/internal/FailingClientStream;

    sget-object v4, Lio/grpc/internal/ClientStreamListener$RpcProgress;->REFUSED:Lio/grpc/internal/ClientStreamListener$RpcProgress;

    .line 247
    invoke-static {v1}, Lio/grpc/internal/DelayedClientTransport$PendingStream;->access$200(Lio/grpc/internal/DelayedClientTransport$PendingStream;)[Lio/grpc/ClientStreamTracer;

    move-result-object v5

    invoke-direct {v3, p1, v4, v5}, Lio/grpc/internal/FailingClientStream;-><init>(Lio/grpc/Status;Lio/grpc/internal/ClientStreamListener$RpcProgress;[Lio/grpc/ClientStreamTracer;)V

    .line 246
    invoke-virtual {v1, v3}, Lio/grpc/internal/DelayedClientTransport$PendingStream;->setStream(Lio/grpc/internal/ClientStream;)Ljava/lang/Runnable;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 252
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 255
    :cond_2
    iget-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->syncContext:Lio/grpc/SynchronizationContext;

    invoke-virtual {p1, v2}, Lio/grpc/SynchronizationContext;->execute(Ljava/lang/Runnable;)V

    :cond_3
    return-void

    :catchall_0
    move-exception p1

    .line 243
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public final start(Lio/grpc/internal/ManagedClientTransport$Listener;)Ljava/lang/Runnable;
    .locals 1

    .line 106
    iput-object p1, p0, Lio/grpc/internal/DelayedClientTransport;->listener:Lio/grpc/internal/ManagedClientTransport$Listener;

    .line 107
    new-instance v0, Lio/grpc/internal/DelayedClientTransport$1;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/DelayedClientTransport$1;-><init>(Lio/grpc/internal/DelayedClientTransport;Lio/grpc/internal/ManagedClientTransport$Listener;)V

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportInUse:Ljava/lang/Runnable;

    .line 113
    new-instance v0, Lio/grpc/internal/DelayedClientTransport$2;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/DelayedClientTransport$2;-><init>(Lio/grpc/internal/DelayedClientTransport;Lio/grpc/internal/ManagedClientTransport$Listener;)V

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportNotInUse:Ljava/lang/Runnable;

    .line 119
    new-instance v0, Lio/grpc/internal/DelayedClientTransport$3;

    invoke-direct {v0, p0, p1}, Lio/grpc/internal/DelayedClientTransport$3;-><init>(Lio/grpc/internal/DelayedClientTransport;Lio/grpc/internal/ManagedClientTransport$Listener;)V

    iput-object v0, p0, Lio/grpc/internal/DelayedClientTransport;->reportTransportTerminated:Ljava/lang/Runnable;

    const/4 p1, 0x0

    return-object p1
.end method
