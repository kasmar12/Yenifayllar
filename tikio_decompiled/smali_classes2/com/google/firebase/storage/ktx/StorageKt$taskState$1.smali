.class final Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "Storage.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/storage/ktx/StorageKt;->getTaskState(Lcom/google/firebase/storage/StorageTask;)Lkotlinx/coroutines/flow/Flow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/channels/ProducerScope<",
        "-",
        "Lcom/google/firebase/storage/ktx/TaskState<",
        "TT;>;>;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000\u00030\u0002H\u008a@"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/channels/ProducerScope;",
        "Lcom/google/firebase/storage/ktx/TaskState;"
    }
    k = 0x3
    mv = {
        0x1,
        0x7,
        0x1
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.google.firebase.storage.ktx.StorageKt$taskState$1"
    f = "Storage.kt"
    i = {}
    l = {
        0x15e
    }
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $this_taskState:Lcom/google/firebase/storage/StorageTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/storage/StorageTask<",
            "TT;>;"
        }
    .end annotation
.end field

.field private synthetic L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method public static synthetic $r8$lambda$8jsljNVAbATtglQhMC0brH6R5BM(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invokeSuspend$lambda-4(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic $r8$lambda$E8L7NGY1EgEbj6WbWrhuEOsS-e8(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invokeSuspend$lambda-1(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    return-void
.end method

.method public static synthetic $r8$lambda$EuWcyasUL8Net0yduL-bEmCmLeY(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invokeSuspend$lambda-3(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    return-void
.end method

.method public static synthetic $r8$lambda$NeCnJDZeArnoNTLlBJOc-awAtsk(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invokeSuspend$lambda-1$lambda-0(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Z_7dJ-mKqEndMsrT3z8haVnoj5w(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invokeSuspend$lambda-3$lambda-2(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/storage/StorageTask;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/storage/StorageTask<",
            "TT;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$this_taskState:Lcom/google/firebase/storage/StorageTask;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method

.method private static final invokeSuspend$lambda-1(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 2

    .line 324
    invoke-static {}, Lcom/google/firebase/storage/StorageTaskScheduler;->getInstance()Lcom/google/firebase/storage/StorageTaskScheduler;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda3;-><init>(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageTaskScheduler;->scheduleCallback(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final invokeSuspend$lambda-1$lambda-0(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 1

    .line 325
    check-cast p0, Lkotlinx/coroutines/channels/SendChannel;

    new-instance v0, Lcom/google/firebase/storage/ktx/TaskState$InProgress;

    invoke-direct {v0, p1}, Lcom/google/firebase/storage/ktx/TaskState$InProgress;-><init>(Ljava/lang/Object;)V

    invoke-static {p0, v0}, Lkotlinx/coroutines/channels/ChannelsKt;->trySendBlocking(Lkotlinx/coroutines/channels/SendChannel;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static final invokeSuspend$lambda-3(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 2

    .line 330
    invoke-static {}, Lcom/google/firebase/storage/StorageTaskScheduler;->getInstance()Lcom/google/firebase/storage/StorageTaskScheduler;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda4;-><init>(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageTaskScheduler;->scheduleCallback(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final invokeSuspend$lambda-3$lambda-2(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/firebase/storage/StorageTask$SnapshotBase;)V
    .locals 1

    .line 331
    check-cast p0, Lkotlinx/coroutines/channels/SendChannel;

    new-instance v0, Lcom/google/firebase/storage/ktx/TaskState$Paused;

    invoke-direct {v0, p1}, Lcom/google/firebase/storage/ktx/TaskState$Paused;-><init>(Ljava/lang/Object;)V

    invoke-static {p0, v0}, Lkotlinx/coroutines/channels/ChannelsKt;->trySendBlocking(Lkotlinx/coroutines/channels/SendChannel;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static final invokeSuspend$lambda-4(Lkotlinx/coroutines/channels/ProducerScope;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 338
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    check-cast p0, Lkotlinx/coroutines/channels/SendChannel;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-static {p0, v0, p1, v0}, Lkotlinx/coroutines/channels/SendChannel$DefaultImpls;->close$default(Lkotlinx/coroutines/channels/SendChannel;Ljava/lang/Throwable;ILjava/lang/Object;)Z

    goto :goto_0

    .line 341
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    .line 342
    check-cast p0, Lkotlinx/coroutines/CoroutineScope;

    check-cast p1, Ljava/lang/Throwable;

    const-string v0, "Error getting the TaskState"

    invoke-static {p0, v0, p1}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel(Lkotlinx/coroutines/CoroutineScope;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;

    iget-object v1, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$this_taskState:Lcom/google/firebase/storage/StorageTask;

    invoke-direct {v0, v1, p2}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;-><init>(Lcom/google/firebase/storage/StorageTask;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lkotlinx/coroutines/channels/ProducerScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invoke(Lkotlinx/coroutines/channels/ProducerScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lkotlinx/coroutines/channels/ProducerScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/channels/ProducerScope<",
            "-",
            "Lcom/google/firebase/storage/ktx/TaskState<",
            "TT;>;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;

    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 321
    iget v1, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    if-ne v1, v2, :cond_0

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_0

    .line 355
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 321
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->L$0:Ljava/lang/Object;

    check-cast p1, Lkotlinx/coroutines/channels/ProducerScope;

    .line 322
    new-instance v1, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda2;-><init>(Lkotlinx/coroutines/channels/ProducerScope;)V

    .line 328
    new-instance v3, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda1;

    invoke-direct {v3, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda1;-><init>(Lkotlinx/coroutines/channels/ProducerScope;)V

    .line 336
    new-instance v4, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda0;

    invoke-direct {v4, p1}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$$ExternalSyntheticLambda0;-><init>(Lkotlinx/coroutines/channels/ProducerScope;)V

    .line 346
    iget-object v5, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$this_taskState:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v5, v1}, Lcom/google/firebase/storage/StorageTask;->addOnProgressListener(Lcom/google/firebase/storage/OnProgressListener;)Lcom/google/firebase/storage/StorageTask;

    .line 347
    iget-object v5, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$this_taskState:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v5, v3}, Lcom/google/firebase/storage/StorageTask;->addOnPausedListener(Lcom/google/firebase/storage/OnPausedListener;)Lcom/google/firebase/storage/StorageTask;

    .line 348
    iget-object v5, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$this_taskState:Lcom/google/firebase/storage/StorageTask;

    invoke-virtual {v5, v4}, Lcom/google/firebase/storage/StorageTask;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/firebase/storage/StorageTask;

    .line 350
    new-instance v5, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$1;

    iget-object v6, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->$this_taskState:Lcom/google/firebase/storage/StorageTask;

    invoke-direct {v5, v6, v1, v3, v4}, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1$1;-><init>(Lcom/google/firebase/storage/StorageTask;Lcom/google/firebase/storage/OnProgressListener;Lcom/google/firebase/storage/OnPausedListener;Lcom/google/android/gms/tasks/OnCompleteListener;)V

    check-cast v5, Lkotlin/jvm/functions/Function0;

    move-object v1, p0

    check-cast v1, Lkotlin/coroutines/Continuation;

    iput v2, p0, Lcom/google/firebase/storage/ktx/StorageKt$taskState$1;->label:I

    invoke-static {p1, v5, v1}, Lkotlinx/coroutines/channels/ProduceKt;->awaitClose(Lkotlinx/coroutines/channels/ProducerScope;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_2

    return-object v0

    .line 355
    :cond_2
    :goto_0
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method
