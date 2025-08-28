.class final Lcom/google/android/gms/internal/firebase-auth-api/zzahu;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field private final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaik;

.field private final zzb:[B


# direct methods
.method private constructor <init>(I)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-array p1, p1, [B

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahu;->zzb:[B

    .line 6
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb([B)Lcom/google/android/gms/internal/firebase-auth-api/zzaik;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaik;

    return-void
.end method

.method synthetic constructor <init>(ILcom/google/android/gms/internal/firebase-auth-api/zzahx;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahu;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/internal/firebase-auth-api/zzahp;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaik;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb()V

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahz;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahu;->zzb:[B

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahz;-><init>([B)V

    return-object v0
.end method

.method public final zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzaik;
    .locals 1

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahu;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaik;

    return-object v0
.end method
