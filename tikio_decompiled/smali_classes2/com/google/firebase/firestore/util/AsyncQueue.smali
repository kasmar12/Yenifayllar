.class public Lcom/google/firebase/firestore/util/AsyncQueue;
.super Ljava/lang/Object;
.source "AsyncQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;,
        Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;,
        Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;
    }
.end annotation


# instance fields
.field private final delayedTasks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;",
            ">;"
        }
    .end annotation
.end field

.field private final executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

.field private final timerIdsToSkip:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 402
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 400
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->timerIdsToSkip:Ljava/util/ArrayList;

    .line 403
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->delayedTasks:Ljava/util/ArrayList;

    .line 404
    new-instance v0, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-direct {v0, p0}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;-><init>(Lcom/google/firebase/firestore/util/AsyncQueue;)V

    iput-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/firestore/util/AsyncQueue;)Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;
    .locals 0

    .line 47
    iget-object p0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    return-object p0
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue;->removeDelayedTask(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)V

    return-void
.end method

.method public static callTask(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Callable<",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 168
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 169
    new-instance v1, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1, p0, v0}, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda4;-><init>(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 191
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method private createAndScheduleDelayedTask(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JLjava/lang/Runnable;)Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;
    .locals 9

    .line 633
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long v5, v0, p2

    .line 634
    new-instance v0, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    const/4 v8, 0x0

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move-object v7, p4

    invoke-direct/range {v2 .. v8}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;-><init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JLjava/lang/Runnable;Lcom/google/firebase/firestore/util/AsyncQueue$1;)V

    .line 635
    invoke-static {v0, p2, p3}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->access$1200(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;J)V

    return-object v0
.end method

.method static synthetic lambda$callTask$0(Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/Task;)Ljava/lang/Void;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 177
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_0

    .line 180
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$callTask$1(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 172
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/tasks/Task;

    new-instance v0, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 173
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/tasks/Task;->continueWith(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 187
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unhandled throwable in callTask."

    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    invoke-virtual {p2, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_0

    :catch_0
    move-exception p0

    .line 185
    invoke-virtual {p2, p0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$enqueue$2(Ljava/lang/Runnable;)Ljava/lang/Void;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 444
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$panic$3(Ljava/lang/Throwable;)V
    .locals 2

    .line 531
    instance-of v0, p0, Ljava/lang/OutOfMemoryError;

    if-eqz v0, :cond_0

    .line 535
    new-instance v0, Ljava/lang/OutOfMemoryError;

    const-string v1, "Firestore (24.9.1) ran out of memory. Check your queries to make sure they are not loading an excessive amount of data."

    invoke-direct {v0, v1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    .line 542
    invoke-virtual {v0, p0}, Ljava/lang/OutOfMemoryError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 543
    throw v0

    .line 545
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error in Cloud Firestore (24.9.1)."

    invoke-direct {v0, v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method static synthetic lambda$runDelayedTasksUntil$5(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)I
    .locals 2

    .line 602
    invoke-static {p0}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->access$1300(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)J

    move-result-wide v0

    invoke-static {p1}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->access$1300(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)J

    move-result-wide p0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$runSync$4(Ljava/lang/Runnable;[Ljava/lang/Throwable;Ljava/util/concurrent/Semaphore;)V
    .locals 1

    .line 559
    :try_start_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    const/4 v0, 0x0

    .line 561
    aput-object p0, p1, v0

    .line 563
    :goto_0
    invoke-virtual {p2}, Ljava/util/concurrent/Semaphore;->release()V

    return-void
.end method

.method private removeDelayedTask(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)V
    .locals 2

    .line 641
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->delayedTasks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Delayed task not found."

    .line 642
    invoke-static {p1, v1, v0}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public containsDelayedTask(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)Z
    .locals 2

    .line 575
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->delayedTasks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    .line 576
    invoke-static {v1}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->access$900(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    move-result-object v1

    if-ne v1, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public enqueue(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .line 442
    new-instance v0, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda6;

    invoke-direct {v0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda6;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public enqueue(Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)",
            "Lcom/google/android/gms/tasks/Task<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/CheckReturnValue;
    .end annotation

    .line 431
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$500(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public enqueueAfterDelay(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JLjava/lang/Runnable;)Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;
    .locals 1

    .line 496
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->timerIdsToSkip:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 p2, 0x0

    .line 500
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/firebase/firestore/util/AsyncQueue;->createAndScheduleDelayedTask(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;JLjava/lang/Runnable;)Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    move-result-object p1

    .line 501
    iget-object p2, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->delayedTasks:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public enqueueAndForget(Ljava/lang/Runnable;)V
    .locals 0

    .line 480
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueue(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public enqueueAndForgetEvenAfterShutdown(Ljava/lang/Runnable;)V
    .locals 1

    .line 463
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-virtual {v0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->executeEvenAfterShutdown(Ljava/lang/Runnable;)V

    return-void
.end method

.method public enqueueAndInitiateShutdown(Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 455
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-static {v0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$600(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;Ljava/lang/Runnable;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 408
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    return-object v0
.end method

.method public isShuttingDown()Z
    .locals 1

    .line 468
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-static {v0}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$700(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;)Z

    move-result v0

    return v0
.end method

.method public synthetic lambda$runDelayedTasksUntil$6$com-google-firebase-firestore-util-AsyncQueue(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)V
    .locals 3

    .line 594
    sget-object v0, Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;->ALL:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_1

    .line 595
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue;->containsDelayedTask(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const-string v1, "Attempted to run tasks until missing TimerId: %s"

    .line 594
    invoke-static {v0, v1, v2}, Lcom/google/firebase/firestore/util/Assert;->hardAssert(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 602
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->delayedTasks:Ljava/util/ArrayList;

    sget-object v1, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda5;->INSTANCE:Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda5;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 606
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->delayedTasks:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;

    .line 607
    invoke-virtual {v1}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->skipDelay()V

    .line 608
    sget-object v2, Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;->ALL:Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    if-eq p1, v2, :cond_2

    invoke-static {v1}, Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;->access$900(Lcom/google/firebase/firestore/util/AsyncQueue$DelayedTask;)Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;

    move-result-object v1

    if-ne v1, p1, :cond_2

    :cond_3
    return-void
.end method

.method public panic(Ljava/lang/Throwable;)V
    .locals 2

    .line 524
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-static {v0}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$800(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;)V

    .line 528
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 529
    new-instance v1, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1}, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public runDelayedTasksUntil(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 592
    new-instance v0, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)V

    invoke-virtual {p0, v0}, Lcom/google/firebase/firestore/util/AsyncQueue;->runSync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public runSync(Ljava/lang/Runnable;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 554
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Throwable;

    .line 556
    new-instance v4, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda2;

    invoke-direct {v4, p1, v3, v0}, Lcom/google/firebase/firestore/util/AsyncQueue$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Runnable;[Ljava/lang/Throwable;Ljava/util/concurrent/Semaphore;)V

    invoke-virtual {p0, v4}, Lcom/google/firebase/firestore/util/AsyncQueue;->enqueueAndForget(Ljava/lang/Runnable;)V

    .line 566
    invoke-virtual {v0, v2}, Ljava/util/concurrent/Semaphore;->acquire(I)V

    .line 567
    aget-object p1, v3, v1

    if-nez p1, :cond_0

    return-void

    .line 568
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    aget-object v0, v3, v1

    const-string v1, "Synchronous task failed"

    invoke-direct {p1, v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public shutdown()V
    .locals 2

    .line 621
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$1000(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;I)V

    return-void
.end method

.method public skipDelaysForTimerId(Lcom/google/firebase/firestore/util/AsyncQueue$TimerId;)V
    .locals 1

    .line 513
    iget-object v0, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->timerIdsToSkip:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public verifyIsCurrentThread()V
    .locals 5

    .line 413
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 414
    iget-object v1, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-static {v1}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$300(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;)Ljava/lang/Thread;

    move-result-object v1

    if-ne v1, v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 415
    iget-object v3, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    .line 418
    invoke-static {v3}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$300(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;)Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/firebase/firestore/util/AsyncQueue;->executor:Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;

    invoke-static {v3}, Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;->access$300(Lcom/google/firebase/firestore/util/AsyncQueue$SynchronizedShutdownAwareExecutor;)Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "We are running on the wrong thread. Expected to be on the AsyncQueue thread %s/%d but was %s/%d"

    .line 415
    invoke-static {v0, v1}, Lcom/google/firebase/firestore/util/Assert;->fail(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0
.end method
