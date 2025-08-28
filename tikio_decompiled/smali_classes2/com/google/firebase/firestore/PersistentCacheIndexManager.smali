.class public final Lcom/google/firebase/firestore/PersistentCacheIndexManager;
.super Ljava/lang/Object;
.source "PersistentCacheIndexManager.java"


# instance fields
.field private client:Lcom/google/firebase/firestore/core/FirestoreClient;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/core/FirestoreClient;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/google/firebase/firestore/PersistentCacheIndexManager;->client:Lcom/google/firebase/firestore/core/FirestoreClient;

    return-void
.end method


# virtual methods
.method public deleteAllIndexes()V
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/google/firebase/firestore/PersistentCacheIndexManager;->client:Lcom/google/firebase/firestore/core/FirestoreClient;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/core/FirestoreClient;->deleteAllFieldIndexes()V

    return-void
.end method

.method public disableIndexAutoCreation()V
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/google/firebase/firestore/PersistentCacheIndexManager;->client:Lcom/google/firebase/firestore/core/FirestoreClient;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FirestoreClient;->setIndexAutoCreationEnabled(Z)V

    return-void
.end method

.method public enableIndexAutoCreation()V
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/google/firebase/firestore/PersistentCacheIndexManager;->client:Lcom/google/firebase/firestore/core/FirestoreClient;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FirestoreClient;->setIndexAutoCreationEnabled(Z)V

    return-void
.end method
