.class public final synthetic Lcom/google/firebase/firestore/local/LocalStore$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/firestore/util/Consumer;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/firestore/local/IndexManager;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/firestore/local/IndexManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/local/LocalStore$$ExternalSyntheticLambda0;->f$0:Lcom/google/firebase/firestore/local/IndexManager;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/local/LocalStore$$ExternalSyntheticLambda0;->f$0:Lcom/google/firebase/firestore/local/IndexManager;

    check-cast p1, Lcom/google/firebase/firestore/model/FieldIndex;

    invoke-interface {v0, p1}, Lcom/google/firebase/firestore/local/IndexManager;->addFieldIndex(Lcom/google/firebase/firestore/model/FieldIndex;)V

    return-void
.end method
