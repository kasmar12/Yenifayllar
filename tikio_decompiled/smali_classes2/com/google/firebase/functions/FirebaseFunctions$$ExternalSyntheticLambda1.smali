.class public final synthetic Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/functions/FirebaseFunctions;

.field public final synthetic f$1:Lcom/google/firebase/functions/HttpsCallOptions;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/functions/FirebaseFunctions;Lcom/google/firebase/functions/HttpsCallOptions;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;->f$0:Lcom/google/firebase/functions/FirebaseFunctions;

    iput-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;->f$1:Lcom/google/firebase/functions/HttpsCallOptions;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;->f$0:Lcom/google/firebase/functions/FirebaseFunctions;

    iget-object v1, p0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;->f$1:Lcom/google/firebase/functions/HttpsCallOptions;

    invoke-virtual {v0, v1, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->lambda$call$3$com-google-firebase-functions-FirebaseFunctions(Lcom/google/firebase/functions/HttpsCallOptions;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
