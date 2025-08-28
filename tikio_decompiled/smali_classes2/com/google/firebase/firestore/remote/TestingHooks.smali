.class final Lcom/google/firebase/firestore/remote/TestingHooks;
.super Ljava/lang/Object;
.source "TestingHooks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterBloomFilterInfo;,
        Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchInfo;,
        Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchListener;
    }
.end annotation


# static fields
.field private static final instance:Lcom/google/firebase/firestore/remote/TestingHooks;


# instance fields
.field private final existenceFilterMismatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchListener;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/google/firebase/firestore/remote/TestingHooks;

    invoke-direct {v0}, Lcom/google/firebase/firestore/remote/TestingHooks;-><init>()V

    sput-object v0, Lcom/google/firebase/firestore/remote/TestingHooks;->instance:Lcom/google/firebase/firestore/remote/TestingHooks;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/firestore/remote/TestingHooks;->existenceFilterMismatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method

.method static getInstance()Lcom/google/firebase/firestore/remote/TestingHooks;
    .locals 1

    .line 52
    sget-object v0, Lcom/google/firebase/firestore/remote/TestingHooks;->instance:Lcom/google/firebase/firestore/remote/TestingHooks;

    return-object v0
.end method


# virtual methods
.method addExistenceFilterMismatchListener(Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchListener;)Lcom/google/firebase/firestore/ListenerRegistration;
    .locals 1

    const-string v0, "a null listener is not allowed"

    .line 93
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 96
    iget-object p1, p0, Lcom/google/firebase/firestore/remote/TestingHooks;->existenceFilterMismatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance p1, Lcom/google/firebase/firestore/remote/TestingHooks$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0, v0}, Lcom/google/firebase/firestore/remote/TestingHooks$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/remote/TestingHooks;Ljava/util/concurrent/atomic/AtomicReference;)V

    return-object p1
.end method

.method public synthetic lambda$addExistenceFilterMismatchListener$0$com-google-firebase-firestore-remote-TestingHooks(Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 1

    const/4 v0, 0x0

    .line 99
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 100
    iget-object v0, p0, Lcom/google/firebase/firestore/remote/TestingHooks;->existenceFilterMismatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method notifyOnExistenceFilterMismatch(Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchInfo;)V
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/google/firebase/firestore/remote/TestingHooks;->existenceFilterMismatchListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 64
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchListener;

    if-eqz v1, :cond_0

    .line 66
    invoke-interface {v1, p1}, Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchListener;->onExistenceFilterMismatch(Lcom/google/firebase/firestore/remote/TestingHooks$ExistenceFilterMismatchInfo;)V

    goto :goto_0

    :cond_1
    return-void
.end method
