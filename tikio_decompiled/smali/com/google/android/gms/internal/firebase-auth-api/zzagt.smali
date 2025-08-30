.class public final Lcom/google/android/gms/internal/firebase-auth-api/zzagt;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;
.source "com.google.firebase:firebase-auth@@22.3.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzacp;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/gms/internal/firebase-auth-api/zzagt;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Ljava/lang/String;

.field private zzc:Ljava/lang/String;

.field private zzd:Ljava/lang/String;

.field private zze:Ljava/lang/String;

.field private zzf:Ljava/lang/String;

.field private zzg:Ljava/lang/String;

.field private zzh:Ljava/lang/String;

.field private zzi:Z

.field private zzj:Z

.field private zzk:Ljava/lang/String;

.field private zzl:Ljava/lang/String;

.field private zzm:Ljava/lang/String;

.field private zzn:Ljava/lang/String;

.field private zzo:Z

.field private zzp:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzags;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzags;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    const/4 v0, 0x1

    .line 32
    iput-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    .line 33
    iput-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzj:Z

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/auth/internal/zzm;Ljava/lang/String;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    .line 36
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzm;->zzd()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzl:Ljava/lang/String;

    .line 38
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzm:Ljava/lang/String;

    .line 39
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzm;->zzc()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zze:Ljava/lang/String;

    const/4 p1, 0x1

    .line 40
    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    .line 41
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "providerId="

    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zze:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzg:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    const-string p4, "http://localhost"

    .line 46
    iput-object p4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zza:Ljava/lang/String;

    .line 47
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzc:Ljava/lang/String;

    .line 48
    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzd:Ljava/lang/String;

    .line 49
    iput-object p5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzh:Ljava/lang/String;

    .line 50
    iput-object p6, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzk:Ljava/lang/String;

    .line 51
    iput-object p7, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzn:Ljava/lang/String;

    .line 52
    iput-object p8, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzp:Ljava/lang/String;

    const/4 p2, 0x1

    .line 53
    iput-boolean p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    .line 54
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzd:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzk:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "idToken, accessToken and authCode cannot all be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_1
    :goto_0
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zze:Ljava/lang/String;

    const/4 p1, 0x0

    .line 57
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzf:Ljava/lang/String;

    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzc:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    const-string p4, "&"

    if-nez p3, :cond_2

    const-string p3, "id_token="

    .line 60
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzc:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    :cond_2
    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzd:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_3

    const-string p3, "access_token="

    .line 62
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzd:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    :cond_3
    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzf:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_4

    const-string p3, "identifier="

    .line 64
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzf:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    :cond_4
    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzh:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_5

    const-string p3, "oauth_token_secret="

    .line 66
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzh:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    :cond_5
    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzk:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_6

    const-string p3, "code="

    .line 68
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzk:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    :cond_6
    invoke-static {p9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_7

    const-string p3, "nonce="

    .line 70
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    const-string p3, "providerId="

    .line 71
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zze:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzg:Ljava/lang/String;

    .line 73
    iput-boolean p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzj:Z

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 2

    move-object v0, p0

    .line 75
    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    move-object v1, p1

    .line 76
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zza:Ljava/lang/String;

    move-object v1, p2

    .line 77
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzb:Ljava/lang/String;

    move-object v1, p3

    .line 78
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzc:Ljava/lang/String;

    move-object v1, p4

    .line 79
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzd:Ljava/lang/String;

    move-object v1, p5

    .line 80
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zze:Ljava/lang/String;

    move-object v1, p6

    .line 81
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzf:Ljava/lang/String;

    move-object v1, p7

    .line 82
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzg:Ljava/lang/String;

    move-object v1, p8

    .line 83
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzh:Ljava/lang/String;

    move v1, p9

    .line 84
    iput-boolean v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    move v1, p10

    .line 85
    iput-boolean v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzj:Z

    move-object v1, p11

    .line 86
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzk:Ljava/lang/String;

    move-object v1, p12

    .line 87
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzl:Ljava/lang/String;

    move-object v1, p13

    .line 88
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzm:Ljava/lang/String;

    move-object/from16 v1, p14

    .line 89
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzn:Ljava/lang/String;

    move/from16 v1, p15

    .line 90
    iput-boolean v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzo:Z

    move-object/from16 v1, p16

    .line 91
    iput-object v1, v0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzp:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    .line 94
    invoke-static {p1}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->beginObjectHeader(Landroid/os/Parcel;)I

    move-result p2

    .line 96
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zza:Ljava/lang/String;

    const/4 v1, 0x2

    const/4 v2, 0x0

    .line 98
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 100
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzb:Ljava/lang/String;

    const/4 v1, 0x3

    .line 102
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 104
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzc:Ljava/lang/String;

    const/4 v1, 0x4

    .line 106
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 108
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzd:Ljava/lang/String;

    const/4 v1, 0x5

    .line 110
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 112
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zze:Ljava/lang/String;

    const/4 v1, 0x6

    .line 114
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 116
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzf:Ljava/lang/String;

    const/4 v1, 0x7

    .line 118
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 120
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzg:Ljava/lang/String;

    const/16 v1, 0x8

    .line 122
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 124
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzh:Ljava/lang/String;

    const/16 v1, 0x9

    .line 126
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 128
    iget-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    const/16 v1, 0xa

    .line 129
    invoke-static {p1, v1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBoolean(Landroid/os/Parcel;IZ)V

    .line 131
    iget-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzj:Z

    const/16 v1, 0xb

    .line 132
    invoke-static {p1, v1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBoolean(Landroid/os/Parcel;IZ)V

    .line 134
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzk:Ljava/lang/String;

    const/16 v1, 0xc

    .line 136
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 138
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzl:Ljava/lang/String;

    const/16 v1, 0xd

    .line 140
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 142
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzm:Ljava/lang/String;

    const/16 v1, 0xe

    .line 144
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 146
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzn:Ljava/lang/String;

    const/16 v1, 0xf

    .line 148
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 150
    iget-boolean v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzo:Z

    const/16 v1, 0x10

    .line 151
    invoke-static {p1, v1, v0}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeBoolean(Landroid/os/Parcel;IZ)V

    .line 153
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzp:Ljava/lang/String;

    const/16 v1, 0x11

    .line 155
    invoke-static {p1, v1, v0, v2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->writeString(Landroid/os/Parcel;ILjava/lang/String;Z)V

    .line 156
    invoke-static {p1, p2}, Lcom/google/android/gms/common/internal/safeparcel/SafeParcelWriter;->finishObjectHeader(Landroid/os/Parcel;I)V

    return-void
.end method

.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzagt;
    .locals 0

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final zza(Z)Lcom/google/android/gms/internal/firebase-auth-api/zzagt;
    .locals 0

    const/4 p1, 0x0

    .line 1
    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzj:Z

    return-object p0
.end method

.method public final zza()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 11
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 12
    iget-boolean v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzj:Z

    const-string v2, "autoCreate"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 13
    iget-boolean v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    const-string v2, "returnSecureToken"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 14
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzb:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v2, "idToken"

    .line 15
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzg:Ljava/lang/String;

    if-eqz v1, :cond_1

    const-string v2, "postBody"

    .line 17
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzn:Ljava/lang/String;

    if-eqz v1, :cond_2

    const-string v2, "tenantId"

    .line 19
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzp:Ljava/lang/String;

    if-eqz v1, :cond_3

    const-string v2, "pendingToken"

    .line 21
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 23
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzl:Ljava/lang/String;

    const-string v2, "sessionId"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzm:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "requestUri"

    if-nez v1, :cond_5

    .line 25
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzm:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 26
    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zza:Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 27
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    :cond_6
    :goto_0
    iget-boolean v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzo:Z

    const-string v2, "returnIdpCredential"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 29
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzagt;
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzn:Ljava/lang/String;

    return-object p0
.end method

.method public final zzb(Z)Lcom/google/android/gms/internal/firebase-auth-api/zzagt;
    .locals 0

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzo:Z

    return-object p0
.end method

.method public final zzc(Z)Lcom/google/android/gms/internal/firebase-auth-api/zzagt;
    .locals 0

    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzagt;->zzi:Z

    return-object p0
.end method
