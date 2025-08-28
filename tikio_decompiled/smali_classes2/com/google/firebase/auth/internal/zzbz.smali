.class final Lcom/google/firebase/auth/internal/zzbz;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/BackgroundDetector$BackgroundStateChangeListener;


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/internal/zzbw;


# direct methods
.method constructor <init>(Lcom/google/firebase/auth/internal/zzbw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbz;->zza:Lcom/google/firebase/auth/internal/zzbw;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBackgroundStateChanged(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 3
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbz;->zza:Lcom/google/firebase/auth/internal/zzbw;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzbw;->zza(Lcom/google/firebase/auth/internal/zzbw;Z)V

    .line 4
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbz;->zza:Lcom/google/firebase/auth/internal/zzbw;

    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzbw;->zza()V

    return-void

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbz;->zza:Lcom/google/firebase/auth/internal/zzbw;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzbw;->zza(Lcom/google/firebase/auth/internal/zzbw;Z)V

    .line 6
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbz;->zza:Lcom/google/firebase/auth/internal/zzbw;

    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbw;->zzb(Lcom/google/firebase/auth/internal/zzbw;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzbz;->zza:Lcom/google/firebase/auth/internal/zzbw;

    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbw;->zza(Lcom/google/firebase/auth/internal/zzbw;)Lcom/google/firebase/auth/internal/zzap;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzap;->zzc()V

    :cond_1
    return-void
.end method
