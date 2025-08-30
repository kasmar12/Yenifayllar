.class public abstract Lcom/google/android/gms/internal/firebase-auth-api/zzaik;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzahm;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzc;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzb;,
        Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;
    }
.end annotation


# static fields
.field private static final zza:Ljava/util/logging/Logger;

.field private static final zzb:Z


# instance fields
.field zze:Lcom/google/android/gms/internal/firebase-auth-api/zzain;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 215
    const-class v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza:Ljava/util/logging/Logger;

    .line 216
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzamk;->zzc()Z

    move-result v0

    sput-boolean v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 217
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahm;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzail;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;-><init>()V

    return-void
.end method

.method public static zza(D)I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public static zza(F)I
    .locals 0

    const/4 p0, 0x4

    return p0
.end method

.method private static zza(I)I
    .locals 1

    shl-int/lit8 v0, p0, 0x1

    shr-int/lit8 p0, p0, 0x1f

    xor-int/2addr p0, v0

    return p0
.end method

.method public static zza(ID)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 24
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x8

    return p0
.end method

.method public static zza(IF)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 50
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static zza(IJ)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 44
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x8

    return p0
.end method

.method public static zza(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)I
    .locals 1

    shl-int/lit8 p0, p0, 0x3

    .line 13
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 15
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zzb()I

    move-result p1

    .line 16
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p1

    add-int/2addr p0, v0

    return p0
.end method

.method public static zza(ILcom/google/android/gms/internal/firebase-auth-api/zzajr;)I
    .locals 2

    const/16 v0, 0x8

    .line 80
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    const/4 v1, 0x2

    .line 82
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(II)I

    move-result p0

    add-int/2addr v0, p0

    const/4 p0, 0x3

    .line 83
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb(ILcom/google/android/gms/internal/firebase-auth-api/zzajr;)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public static zza(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;)I
    .locals 2

    const/16 v0, 0x8

    .line 99
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    const/4 v1, 0x2

    .line 101
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(II)I

    move-result p0

    add-int/2addr v0, p0

    const/16 p0, 0x18

    .line 106
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 107
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)I

    move-result p1

    add-int/2addr p0, p1

    add-int/2addr v0, p0

    return v0
.end method

.method static zza(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    shl-int/lit8 p0, p0, 0x3

    .line 56
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    shl-int/lit8 p0, p0, 0x1

    .line 58
    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzahf;

    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahf;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zza(ILjava/lang/String;)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 163
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 164
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(Ljava/lang/String;)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zza(IZ)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 4
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)I
    .locals 1

    .line 18
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zzb()I

    move-result p0

    .line 19
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzajr;)I
    .locals 1

    .line 93
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzajr;->zzb()I

    move-result p0

    .line 94
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method public static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)I
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 60
    invoke-interface {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzakn;->zzl()I

    move-result p0

    return p0
.end method

.method static zza(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I
    .locals 0

    .line 118
    check-cast p0, Lcom/google/android/gms/internal/firebase-auth-api/zzahf;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahf;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I

    move-result p0

    .line 119
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p1

    add-int/2addr p1, p0

    return p1
.end method

.method public static zza(Ljava/lang/String;)I
    .locals 1

    .line 165
    :try_start_0
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaml;->zza(Ljava/lang/CharSequence;)I

    move-result p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzamo; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 168
    :catch_0
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzajf;->zza:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 169
    array-length p0, p0

    .line 171
    :goto_0
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method public static zza(Z)I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public static zza([B)I
    .locals 1

    .line 7
    array-length p0, p0

    .line 8
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method private static zza(J)J
    .locals 3

    const/4 v0, 0x1

    shl-long v0, p0, v0

    const/16 v2, 0x3f

    shr-long/2addr p0, v2

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method public static zza(Ljava/io/OutputStream;I)Lcom/google/android/gms/internal/firebase-auth-api/zzaik;
    .locals 1

    .line 214
    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;-><init>(Ljava/io/OutputStream;I)V

    return-object v0
.end method

.method public static zzb(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 30
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 32
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zze(I)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzb(IJ)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 72
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 74
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(J)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzb(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)I
    .locals 2

    const/16 v0, 0x8

    .line 127
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    const/4 v1, 0x2

    .line 129
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(II)I

    move-result p0

    add-int/2addr v0, p0

    const/4 p0, 0x3

    .line 130
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public static zzb(ILcom/google/android/gms/internal/firebase-auth-api/zzajr;)I
    .locals 1

    shl-int/lit8 p0, p0, 0x3

    .line 88
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 90
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzajr;->zzb()I

    move-result p1

    .line 91
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p1

    add-int/2addr p0, v0

    return p0
.end method

.method static zzb(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 113
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 114
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)I
    .locals 1

    .line 115
    invoke-interface {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzakn;->zzl()I

    move-result p0

    .line 116
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result v0

    add-int/2addr v0, p0

    return v0
.end method

.method public static zzb([B)Lcom/google/android/gms/internal/firebase-auth-api/zzaik;
    .locals 3

    .line 211
    array-length v0, p0

    .line 212
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzc;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzc;-><init>([BII)V

    return-object v1
.end method

.method public static zzc(I)I
    .locals 0

    .line 34
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zze(I)I

    move-result p0

    return p0
.end method

.method public static zzc(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 38
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static zzc(IJ)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 141
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x8

    return p0
.end method

.method public static zzc(J)I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method public static zzd(I)I
    .locals 0

    const/4 p0, 0x4

    return p0
.end method

.method public static zzd(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 64
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 65
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zze(I)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzd(IJ)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 155
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 157
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(J)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(J)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzd(J)I
    .locals 0

    .line 76
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(J)I

    move-result p0

    return p0
.end method

.method static bridge synthetic zzd()Z
    .locals 1

    sget-boolean v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb:Z

    return v0
.end method

.method public static zze(I)I
    .locals 0

    if-ltz p0, :cond_0

    .line 67
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    return p0

    :cond_0
    const/16 p0, 0xa

    return p0
.end method

.method public static zze(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 135
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    add-int/lit8 p0, p0, 0x4

    return p0
.end method

.method public static zze(IJ)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 193
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 194
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(J)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zze(J)I
    .locals 0

    const/16 p0, 0x8

    return p0
.end method

.method static zzf(I)I
    .locals 1

    const/16 v0, 0x1000

    if-le p0, v0, :cond_0

    return v0

    :cond_0
    return p0
.end method

.method public static zzf(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 147
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 149
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(I)I

    move-result p1

    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzf(J)I
    .locals 0

    .line 159
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzg(J)I

    move-result p0

    return p0
.end method

.method public static zzg(I)I
    .locals 0

    const/4 p0, 0x4

    return p0
.end method

.method public static zzg(II)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 179
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    .line 180
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p1

    add-int/2addr p0, p1

    return p0
.end method

.method public static zzg(J)I
    .locals 6

    const-wide/16 v0, -0x80

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    cmp-long v0, p0, v2

    if-gez v0, :cond_1

    const/16 p0, 0xa

    return p0

    :cond_1
    const-wide v0, -0x800000000L

    and-long/2addr v0, p0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    const/4 v0, 0x6

    const/16 v1, 0x1c

    ushr-long/2addr p0, v1

    goto :goto_0

    :cond_2
    const/4 v0, 0x2

    :goto_0
    const-wide/32 v4, -0x200000

    and-long/2addr v4, p0

    cmp-long v1, v4, v2

    if-eqz v1, :cond_3

    add-int/lit8 v0, v0, 0x2

    const/16 v1, 0xe

    ushr-long/2addr p0, v1

    :cond_3
    const-wide/16 v4, -0x4000

    and-long/2addr p0, v4

    cmp-long v1, p0, v2

    if-eqz v1, :cond_4

    add-int/lit8 v0, v0, 0x1

    :cond_4
    return v0
.end method

.method public static zzh(I)I
    .locals 0

    .line 151
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(I)I

    move-result p0

    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    return p0
.end method

.method public static zzi(I)I
    .locals 0

    shl-int/lit8 p0, p0, 0x3

    .line 175
    invoke-static {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(I)I

    move-result p0

    return p0
.end method

.method public static zzj(I)I
    .locals 1

    and-int/lit8 v0, p0, -0x80

    if-nez v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    and-int/lit16 v0, p0, -0x4000

    if-nez v0, :cond_1

    const/4 p0, 0x2

    return p0

    :cond_1
    const/high16 v0, -0x200000

    and-int/2addr v0, p0

    if-nez v0, :cond_2

    const/4 p0, 0x3

    return p0

    :cond_2
    const/high16 v0, -0x10000000

    and-int/2addr p0, v0

    if-nez p0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const/4 p0, 0x5

    return p0
.end method


# virtual methods
.method public abstract zza()I
.end method

.method final zza(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzamo;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza:Ljava/util/logging/Logger;

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v2, "com.google.protobuf.CodedOutputStream"

    const-string v3, "inefficientWriteStringNoTag"

    const-string v4, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!"

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Ljava/util/logging/Logger;->logp(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 222
    sget-object p2, Lcom/google/android/gms/internal/firebase-auth-api/zzajf;->zza:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 223
    :try_start_0
    array-length p2, p1

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    const/4 p2, 0x0

    .line 224
    array-length v0, p1

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahm;->zza([BII)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 227
    new-instance p2, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzb;

    invoke-direct {p2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzb;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public final zzb()V
    .locals 2

    .line 218
    invoke-virtual {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 219
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Did not write as much data as expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract zzb(B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final zzb(D)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 232
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzh(J)V

    return-void
.end method

.method public final zzb(F)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 236
    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(I)V

    return-void
.end method

.method public final zzb(ID)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide p2

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzf(IJ)V

    return-void
.end method

.method public final zzb(IF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    invoke-static {p2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzh(II)V

    return-void
.end method

.method public abstract zzb(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzb(ILjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzb(IZ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzb(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final zzb(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    int-to-byte p1, p1

    .line 228
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb(B)V

    return-void
.end method

.method abstract zzb([BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzc()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzc(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method abstract zzc(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzd(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzf(IJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final zzg(IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 242
    invoke-static {p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(J)J

    move-result-wide p2

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzh(IJ)V

    return-void
.end method

.method public abstract zzh(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzh(IJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzh(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzi(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final zzi(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(J)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(J)V

    return-void
.end method

.method public final zzj(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 238
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzl(II)V

    return-void
.end method

.method public abstract zzj(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzk(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzk(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzl(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract zzl(II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final zzm(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 240
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    return-void
.end method

.method public abstract zzn(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
