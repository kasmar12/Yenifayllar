.class public final Lcom/google/firebase/auth/internal/zzcc;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@22.3.0"


# static fields
.field private static final zza:Lcom/google/firebase/auth/internal/zzcc;


# instance fields
.field private final zzb:Lcom/google/firebase/auth/internal/zzbj;

.field private final zzc:Lcom/google/firebase/auth/internal/zzas;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 4
    new-instance v0, Lcom/google/firebase/auth/internal/zzcc;

    invoke-direct {v0}, Lcom/google/firebase/auth/internal/zzcc;-><init>()V

    sput-object v0, Lcom/google/firebase/auth/internal/zzcc;->zza:Lcom/google/firebase/auth/internal/zzcc;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 5
    invoke-static {}, Lcom/google/firebase/auth/internal/zzbj;->zzc()Lcom/google/firebase/auth/internal/zzbj;

    move-result-object v0

    invoke-static {}, Lcom/google/firebase/auth/internal/zzas;->zza()Lcom/google/firebase/auth/internal/zzas;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/auth/internal/zzcc;-><init>(Lcom/google/firebase/auth/internal/zzbj;Lcom/google/firebase/auth/internal/zzas;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/firebase/auth/internal/zzbj;Lcom/google/firebase/auth/internal/zzas;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzcc;->zzb:Lcom/google/firebase/auth/internal/zzbj;

    .line 9
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzcc;->zzc:Lcom/google/firebase/auth/internal/zzas;

    return-void
.end method

.method public static zzc()Lcom/google/firebase/auth/internal/zzcc;
    .locals 1

    .line 3
    sget-object v0, Lcom/google/firebase/auth/internal/zzcc;->zza:Lcom/google/firebase/auth/internal/zzcc;

    return-object v0
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcc;->zzb:Lcom/google/firebase/auth/internal/zzbj;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzbj;->zza()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public final zza(Landroid/content/Context;)V
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcc;->zzb:Lcom/google/firebase/auth/internal/zzbj;

    invoke-virtual {v0, p1}, Lcom/google/firebase/auth/internal/zzbj;->zza(Landroid/content/Context;)V

    return-void
.end method

.method public final zza(Lcom/google/firebase/auth/FirebaseAuth;)V
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcc;->zzb:Lcom/google/firebase/auth/internal/zzbj;

    invoke-virtual {v0, p1}, Lcom/google/firebase/auth/internal/zzbj;->zza(Lcom/google/firebase/auth/FirebaseAuth;)V

    return-void
.end method

.method public final zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            ")Z"
        }
    .end annotation

    .line 15
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcc;->zzc:Lcom/google/firebase/auth/internal/zzas;

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/firebase/auth/internal/zzas;->zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;)Z

    move-result p1

    return p1
.end method

.method public final zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/FirebaseUser;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            "Lcom/google/firebase/auth/FirebaseUser;",
            ")Z"
        }
    .end annotation

    .line 16
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcc;->zzc:Lcom/google/firebase/auth/internal/zzas;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/firebase/auth/internal/zzas;->zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/FirebaseUser;)Z

    move-result p1

    return p1
.end method

.method public final zzb()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcc;->zzb:Lcom/google/firebase/auth/internal/zzbj;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzbj;->zzb()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method
