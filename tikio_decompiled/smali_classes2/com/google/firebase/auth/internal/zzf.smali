.class final Lcom/google/firebase/auth/internal/zzf;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnSuccessListener<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Lcom/google/android/gms/tasks/TaskCompletionSource;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/internal/zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzf;->zza:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic onSuccess(Ljava/lang/Object;)V
    .locals 2

    .line 2
    check-cast p1, Ljava/lang/String;

    .line 3
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzf;->zza:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 4
    new-instance v1, Lcom/google/firebase/auth/internal/zzl;

    invoke-direct {v1}, Lcom/google/firebase/auth/internal/zzl;-><init>()V

    .line 5
    invoke-virtual {v1, p1}, Lcom/google/firebase/auth/internal/zzh;->zzb(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzh;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzh;->zza()Lcom/google/firebase/auth/internal/zze;

    move-result-object p1

    .line 6
    invoke-virtual {v0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method
