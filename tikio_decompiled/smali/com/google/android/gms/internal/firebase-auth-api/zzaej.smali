.class final Lcom/google/android/gms/internal/firebase-auth-api/zzaej;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzafy;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Ljava/lang/String;

.field private zzc:Ljava/lang/String;

.field private zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

.field private zze:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzafy;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaey;)Lcom/google/android/gms/internal/firebase-auth-api/zzafy;
    .locals 1

    const-string v0, "Null tokenType"

    .line 16
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    return-object p0
.end method

.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzafy;
    .locals 1

    const-string v0, "Null idToken"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zze:Ljava/lang/String;

    return-object p0
.end method

.method public final zza()Lcom/google/android/gms/internal/firebase-auth-api/zzafz;
    .locals 8

    .line 19
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zza:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzc:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    if-eqz v4, :cond_1

    iget-object v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zze:Ljava/lang/String;

    if-nez v5, :cond_0

    goto :goto_0

    .line 30
    :cond_0
    new-instance v7, Lcom/google/android/gms/internal/firebase-auth-api/zzaeg;

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzb:Ljava/lang/String;

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzaeg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaey;Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzaei;)V

    return-object v7

    .line 20
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zza:Ljava/lang/String;

    if-nez v1, :cond_2

    const-string v1, " providerId"

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzc:Ljava/lang/String;

    if-nez v1, :cond_3

    const-string v1, " token"

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    if-nez v1, :cond_4

    const-string v1, " tokenType"

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zze:Ljava/lang/String;

    if-nez v1, :cond_5

    const-string v1, " idToken"

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Missing required properties:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzafy;
    .locals 1

    const-string v0, "Null providerId"

    .line 6
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zza:Ljava/lang/String;

    return-object p0
.end method

.method public final zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzafy;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final zzd(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzafy;
    .locals 1

    const-string v0, "Null token"

    .line 12
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaej;->zzc:Ljava/lang/String;

    return-object p0
.end method
