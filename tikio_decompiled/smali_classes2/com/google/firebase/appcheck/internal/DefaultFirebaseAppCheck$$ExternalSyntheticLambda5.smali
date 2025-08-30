.class public final synthetic Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

.field public final synthetic f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iput-object p2, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;->f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;->f$0:Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;

    iget-object v1, p0, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck$$ExternalSyntheticLambda5;->f$1:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v0, v1}, Lcom/google/firebase/appcheck/internal/DefaultFirebaseAppCheck;->lambda$retrieveStoredAppCheckTokenInBackground$0$com-google-firebase-appcheck-internal-DefaultFirebaseAppCheck(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method
