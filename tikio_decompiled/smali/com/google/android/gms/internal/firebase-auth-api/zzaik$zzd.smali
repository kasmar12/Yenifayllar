.class final Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;
.source "com.google.firebase:firebase-auth@@22.3.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/firebase-auth-api/zzaik;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "zzd"
.end annotation


# instance fields
.field private final zzf:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;-><init>(I)V

    const-string p2, "out"

    .line 3
    invoke-static {p1, p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzf:Ljava/io/OutputStream;

    return-void
.end method

.method private final zzc([BII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int/2addr v0, v1

    if-lt v0, p3, :cond_0

    .line 20
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zza:[B

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    goto :goto_0

    .line 23
    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int/2addr v0, v1

    .line 24
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zza:[B

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr p2, v0

    sub-int/2addr p3, v0

    .line 27
    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    .line 28
    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    .line 29
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zze()V

    .line 30
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    if-gt p3, v0, :cond_1

    .line 31
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zza:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    iput p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzf:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 34
    :goto_0
    iget p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    return-void
.end method

.method private final zze()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzf:Ljava/io/OutputStream;

    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zza:[B

    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 7
    iput v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    return-void
.end method

.method private final zzo(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int/2addr v0, v1

    if-ge v0, p1, :cond_0

    .line 13
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zze()V

    :cond_0
    return-void
.end method


# virtual methods
.method public final zza([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc([BII)V

    return-void
.end method

.method public final zzb(B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    if-ne v0, v1, :cond_0

    .line 16
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zze()V

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(B)V

    return-void
.end method

.method public final zzb(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x3

    .line 85
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    const/4 v2, 0x2

    .line 86
    invoke-virtual {p0, v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzl(II)V

    .line 88
    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    .line 89
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)V

    const/4 p1, 0x4

    .line 90
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    return-void
.end method

.method public final zzb(ILjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 97
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    .line 98
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb(Ljava/lang/String;)V

    return-void
.end method

.method public final zzb(IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xb

    .line 36
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(II)V

    int-to-byte p1, p2

    .line 38
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(B)V

    return-void
.end method

.method public final zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zzb()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    .line 47
    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahp;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahm;)V

    return-void
.end method

.method final zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/firebase-auth-api/zzahf;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahf;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    .line 83
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zze:Lcom/google/android/gms/internal/firebase-auth-api/zzain;

    invoke-interface {p2, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzalf;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/firebase-auth-api/zzana;)V

    return-void
.end method

.method public final zzb(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    .line 101
    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzj(I)I

    move-result v1

    add-int v2, v1, v0

    .line 102
    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    if-le v2, v3, :cond_0

    .line 103
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 104
    invoke-static {p1, v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaml;->zza(Ljava/lang/CharSequence;[BII)I

    move-result v0

    .line 105
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    .line 106
    invoke-virtual {p0, v1, v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzahm;->zza([BII)V

    return-void

    .line 108
    :cond_0
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int/2addr v0, v3

    if-le v2, v0, :cond_1

    .line 109
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zze()V

    .line 110
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzj(I)I

    move-result v0

    .line 111
    iget v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzamo; {:try_start_0 .. :try_end_0} :catch_2

    if-ne v0, v1, :cond_2

    add-int v1, v2, v0

    .line 113
    :try_start_1
    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    .line 114
    iget-object v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zza:[B

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    iget v4, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzb:I

    iget v5, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int/2addr v4, v5

    invoke-static {p1, v1, v3, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzaml;->zza(Ljava/lang/CharSequence;[BII)I

    move-result v1

    .line 115
    iput v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int v3, v1, v2

    sub-int/2addr v3, v0

    .line 117
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(I)V

    .line 118
    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    goto :goto_0

    .line 120
    :cond_2
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaml;->zza(Ljava/lang/CharSequence;)I

    move-result v3

    .line 121
    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(I)V

    .line 122
    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zza:[B

    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    invoke-static {p1, v0, v1, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaml;->zza(Ljava/lang/CharSequence;[BII)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    .line 123
    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I
    :try_end_1
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzamo; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 130
    :try_start_2
    new-instance v1, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzb;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzb;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_1
    move-exception v0

    .line 126
    iget v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    iget v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    sub-int/2addr v3, v2

    sub-int/2addr v1, v3

    iput v1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzd:I

    .line 127
    iput v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    .line 128
    throw v0
    :try_end_2
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzamo; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    move-exception v0

    .line 132
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzamo;)V

    return-void
.end method

.method public final zzb([BII)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    invoke-virtual {p0, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    const/4 p2, 0x0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc([BII)V

    return-void
.end method

.method public final zzc()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    iget v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzc:I

    if-lez v0, :cond_0

    .line 10
    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zze()V

    :cond_0
    return-void
.end method

.method public final zzc(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 43
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    .line 44
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzahp;)V

    return-void
.end method

.method final zzc(ILcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x2

    .line 76
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    .line 77
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzb(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;Lcom/google/android/gms/internal/firebase-auth-api/zzalf;)V

    return-void
.end method

.method public final zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzakn;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    invoke-interface {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzakn;->zzl()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    .line 80
    invoke-interface {p1, p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzakn;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzaik;)V

    return-void
.end method

.method public final zzd(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x3

    .line 92
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    const/4 v2, 0x2

    .line 93
    invoke-virtual {p0, v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzl(II)V

    .line 94
    invoke-virtual {p0, v1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzc(ILcom/google/android/gms/internal/firebase-auth-api/zzahp;)V

    const/4 p1, 0x4

    .line 95
    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzk(II)V

    return-void
.end method

.method public final zzf(IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x12

    .line 56
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    const/4 v0, 0x1

    .line 57
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(II)V

    .line 58
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(J)V

    return-void
.end method

.method public final zzh(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xe

    .line 49
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    const/4 v0, 0x5

    .line 50
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(II)V

    .line 51
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(I)V

    return-void
.end method

.method public final zzh(IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x14

    .line 145
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    const/4 v0, 0x0

    .line 146
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(II)V

    .line 147
    invoke-virtual {p0, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(J)V

    return-void
.end method

.method public final zzh(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x8

    .line 60
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    .line 61
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(J)V

    return-void
.end method

.method public final zzi(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x14

    .line 63
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    const/4 v0, 0x0

    .line 64
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(II)V

    if-ltz p2, :cond_0

    .line 67
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(I)V

    return-void

    :cond_0
    int-to-long p1, p2

    .line 68
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(J)V

    return-void
.end method

.method public final zzj(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xa

    .line 149
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    .line 150
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(J)V

    return-void
.end method

.method public final zzk(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x4

    .line 53
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    .line 54
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(I)V

    return-void
.end method

.method public final zzk(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    shl-int/lit8 p1, p1, 0x3

    or-int/2addr p1, p2

    .line 136
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    return-void
.end method

.method public final zzl(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_0

    .line 71
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzn(I)V

    return-void

    :cond_0
    int-to-long v0, p1

    .line 72
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik;->zzj(J)V

    return-void
.end method

.method public final zzl(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x14

    .line 138
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    const/4 v0, 0x0

    .line 139
    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zza(II)V

    .line 140
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(I)V

    return-void
.end method

.method public final zzn(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x5

    .line 142
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zzd;->zzo(I)V

    .line 143
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaik$zza;->zzb(I)V

    return-void
.end method
