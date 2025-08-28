.class final Lcom/google/firebase/auth/internal/zzl;
.super Lcom/google/firebase/auth/internal/zzh;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzh;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/firebase/auth/internal/zze;
    .locals 4

    .line 5
    new-instance v0, Lcom/google/firebase/auth/internal/zzi;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzl;->zza:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzl;->zzb:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/firebase/auth/internal/zzi;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzk;)V

    return-object v0
.end method

.method public final zza(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzh;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzl;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final zzb(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzh;
    .locals 0

    .line 3
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzl;->zza:Ljava/lang/String;

    return-object p0
.end method
