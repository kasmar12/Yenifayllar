.class public final synthetic Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/firestore/core/FirestoreClient;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/firestore/core/FirestoreClient;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;->f$0:Lcom/google/firebase/firestore/core/FirestoreClient;

    iput-boolean p2, p0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;->f$0:Lcom/google/firebase/firestore/core/FirestoreClient;

    iget-boolean v1, p0, Lcom/google/firebase/firestore/core/FirestoreClient$$ExternalSyntheticLambda13;->f$1:Z

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/core/FirestoreClient;->lambda$setIndexAutoCreationEnabled$22$com-google-firebase-firestore-core-FirestoreClient(Z)V

    return-void
.end method
