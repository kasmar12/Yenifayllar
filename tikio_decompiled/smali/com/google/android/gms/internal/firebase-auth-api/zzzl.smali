.class final Lcom/google/android/gms/internal/firebase-auth-api/zzzl;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzadk;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzadk<",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzagj;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

.field private final synthetic zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzyj;Lcom/google/android/gms/internal/firebase-auth-api/zzagg;Lcom/google/android/gms/internal/firebase-auth-api/zzacd;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic zza(Ljava/lang/Object;)V
    .locals 3

    .line 5
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzagj;

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    instance-of v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagk;

    if-eqz v1, :cond_0

    .line 7
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacd;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzagj;->zza()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacd;->zzb(Ljava/lang/String;)V

    return-void

    .line 8
    :cond_0
    instance-of v0, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagm;

    if-eqz v0, :cond_1

    .line 9
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacd;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacd;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzagj;)V

    return-void

    .line 10
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzagg;

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "startMfaEnrollmentRequest must be an instance of either StartPhoneMfaEnrollmentRequest or StartTotpMfaEnrollmentRequest but was "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 1

    .line 2
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzan;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzzl;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzacd;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzacd;->zza(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method
