.class public final enum Lcom/google/android/gms/internal/firebase-auth-api/zzaey;
.super Ljava/lang/Enum;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzaey;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

.field private static final enum zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

.field private static final synthetic zzc:[Lcom/google/android/gms/internal/firebase-auth-api/zzaey;


# instance fields
.field private final zzd:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    const-string v1, "ACCESS_TOKEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    .line 3
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    const-string v3, "ID_TOKEN"

    const/4 v4, 0x1

    const-string v5, "idToken"

    invoke-direct {v1, v3, v4, v5}, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 5
    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->zzc:[Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 7
    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->zzd:Ljava/lang/String;

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/firebase-auth-api/zzaey;
    .locals 1

    .line 9
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->zzc:[Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/firebase-auth-api/zzaey;

    return-object v0
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaey;->zzd:Ljava/lang/String;

    return-object v0
.end method
