.class public final enum Lcom/google/android/gms/internal/firebase-auth-api/zzwo;
.super Ljava/lang/Enum;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/internal/firebase-auth-api/zzwo;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

.field public static final enum zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

.field public static final enum zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

.field private static final synthetic zzd:[Lcom/google/android/gms/internal/firebase-auth-api/zzwo;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    const-string v1, "NIST_P256"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    .line 2
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    const-string v3, "NIST_P384"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    .line 3
    new-instance v3, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    const-string v5, "NIST_P521"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 5
    sput-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;->zzd:[Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/firebase-auth-api/zzwo;
    .locals 1

    .line 7
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzwo;->zzd:[Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/firebase-auth-api/zzwo;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/firebase-auth-api/zzwo;

    return-object v0
.end method
