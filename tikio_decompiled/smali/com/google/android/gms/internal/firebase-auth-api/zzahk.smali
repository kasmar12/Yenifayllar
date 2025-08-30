.class final Lcom/google/android/gms/internal/firebase-auth-api/zzahk;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# instance fields
.field public zza:I

.field public zzb:J

.field public zzc:Ljava/lang/Object;

.field public final zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaio;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaio;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzaio;

    .line 4
    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahk;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaio;

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaio;)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahk;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzaio;

    return-void
.end method
