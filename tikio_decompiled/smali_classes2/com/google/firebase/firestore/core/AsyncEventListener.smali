.class public Lcom/google/firebase/firestore/core/AsyncEventListener;
.super Ljava/lang/Object;
.source "AsyncEventListener.java"

# interfaces
.implements Lcom/google/firebase/firestore/EventListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/firebase/firestore/EventListener<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final eventListener:Lcom/google/firebase/firestore/EventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/EventListener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final executor:Ljava/util/concurrent/Executor;

.field private volatile muted:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/firebase/firestore/EventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Lcom/google/firebase/firestore/EventListener<",
            "TT;>;)V"
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput-boolean v0, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->muted:Z

    .line 33
    iput-object p1, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->executor:Ljava/util/concurrent/Executor;

    .line 34
    iput-object p2, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->eventListener:Lcom/google/firebase/firestore/EventListener;

    return-void
.end method


# virtual methods
.method public synthetic lambda$onEvent$0$com-google-firebase-firestore-core-AsyncEventListener(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 1

    .line 41
    iget-boolean v0, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->muted:Z

    if-nez v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->eventListener:Lcom/google/firebase/firestore/EventListener;

    invoke-interface {v0, p1, p2}, Lcom/google/firebase/firestore/EventListener;->onEvent(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    :cond_0
    return-void
.end method

.method public mute()V
    .locals 1

    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->muted:Z

    return-void
.end method

.method public onEvent(Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/firebase/firestore/FirebaseFirestoreException;",
            ")V"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/google/firebase/firestore/core/AsyncEventListener;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/google/firebase/firestore/core/AsyncEventListener$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/firebase/firestore/core/AsyncEventListener$$ExternalSyntheticLambda0;-><init>(Lcom/google/firebase/firestore/core/AsyncEventListener;Ljava/lang/Object;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
