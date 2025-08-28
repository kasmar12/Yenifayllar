.class final Lcom/google/firebase/auth/internal/zzbb;
.super Landroid/content/BroadcastReceiver;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field private final zza:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;"
        }
    .end annotation
.end field

.field private final zzc:Lcom/google/firebase/auth/FirebaseAuth;

.field private final zzd:Lcom/google/firebase/auth/FirebaseUser;

.field private final synthetic zze:Lcom/google/firebase/auth/internal/zzas;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/internal/zzas;Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/FirebaseUser;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            "Lcom/google/firebase/auth/FirebaseUser;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbb;->zze:Lcom/google/firebase/auth/internal/zzas;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbb;->zza:Ljava/lang/ref/WeakReference;

    .line 3
    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 4
    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzbb;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 5
    iput-object p5, p0, Lcom/google/firebase/auth/internal/zzbb;->zzd:Lcom/google/firebase/auth/FirebaseUser;

    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 7
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbb;->zza:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-nez v0, :cond_0

    const-string p2, "FederatedAuthReceiver"

    const-string v0, "Failed to unregister BroadcastReceiver because the Activity that launched this flow has been garbage collected; please do not finish() your Activity while performing a FederatedAuthProvider operation."

    .line 9
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    iget-object p2, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x445b

    const-string v2, "Activity that started the web operation is no longer alive; see logcat for details"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 11
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    move-result-object v0

    .line 12
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 13
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzas;->zza(Landroid/content/Context;)V

    return-void

    :cond_0
    const-string v0, "com.google.firebase.auth.internal.OPERATION"

    .line 15
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 16
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.google.firebase.auth.internal.NONGMSCORE_SIGN_IN"

    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 18
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbb;->zze:Lcom/google/firebase/auth/internal/zzas;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzbb;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-static {v0, p2, v1, v2, p1}, Lcom/google/firebase/auth/internal/zzas;->zza(Lcom/google/firebase/auth/internal/zzas;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Landroid/content/Context;)V

    return-void

    :cond_1
    const-string v1, "com.google.firebase.auth.internal.NONGMSCORE_LINK"

    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 20
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbb;->zze:Lcom/google/firebase/auth/internal/zzas;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzbb;->zzd:Lcom/google/firebase/auth/FirebaseUser;

    invoke-static {v0, p2, v1, v2, p1}, Lcom/google/firebase/auth/internal/zzas;->zza(Lcom/google/firebase/auth/internal/zzas;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseUser;Landroid/content/Context;)V

    return-void

    :cond_2
    const-string v1, "com.google.firebase.auth.internal.NONGMSCORE_REAUTHENTICATE"

    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 22
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbb;->zze:Lcom/google/firebase/auth/internal/zzas;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzbb;->zzd:Lcom/google/firebase/auth/FirebaseUser;

    invoke-static {v0, p2, v1, v2, p1}, Lcom/google/firebase/auth/internal/zzas;->zzb(Lcom/google/firebase/auth/internal/zzas;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseUser;Landroid/content/Context;)V

    return-void

    .line 23
    :cond_3
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "WEB_CONTEXT_CANCELED:Unknown operation received ("

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 24
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzan;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object p2

    .line 25
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    move-result-object p2

    .line 26
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    return-void

    .line 27
    :cond_4
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzca;->zzb(Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 28
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzca;->zza(Landroid/content/Intent;)Lcom/google/android/gms/common/api/Status;

    move-result-object p2

    .line 29
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 30
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    move-result-object p2

    .line 31
    invoke-virtual {v0, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 32
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzas;->zza(Landroid/content/Context;)V

    return-void

    :cond_5
    const-string v0, "com.google.firebase.auth.internal.EXTRA_CANCELED"

    .line 33
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 34
    iget-object p2, p0, Lcom/google/firebase/auth/internal/zzbb;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    const-string v0, "WEB_CONTEXT_CANCELED"

    .line 35
    invoke-static {v0}, Lcom/google/firebase/auth/internal/zzan;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacf;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 38
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzas;->zza(Landroid/content/Context;)V

    :cond_6
    return-void
.end method
