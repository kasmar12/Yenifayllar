.class abstract Lcom/google/android/gms/internal/firebase-auth-api/zzajs;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/firebase-auth-api/zzajs;

.field private static final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzajs;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajv;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzajv;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaju;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajs;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzajs;

    .line 4
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajx;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzajx;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzajw;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajs;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzajs;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzajz;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajs;-><init>()V

    return-void
.end method

.method static zza()Lcom/google/android/gms/internal/firebase-auth-api/zzajs;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajs;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzajs;

    return-object v0
.end method

.method static zzb()Lcom/google/android/gms/internal/firebase-auth-api/zzajs;
    .locals 1

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajs;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzajs;

    return-object v0
.end method


# virtual methods
.method abstract zza(Ljava/lang/Object;J)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "J)",
            "Ljava/util/List<",
            "T",
            "L;",
            ">;"
        }
    .end annotation
.end method

.method abstract zza(Ljava/lang/Object;Ljava/lang/Object;J)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "J)V"
        }
    .end annotation
.end method

.method abstract zzb(Ljava/lang/Object;J)V
.end method
