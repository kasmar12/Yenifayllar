.class public Lcom/google/firebase/storage/UploadTask;
.super Lcom/google/firebase/storage/StorageTask;
.source "UploadTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/storage/UploadTask$TaskSnapshot;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/firebase/storage/StorageTask<",
        "Lcom/google/firebase/storage/UploadTask$TaskSnapshot;",
        ">;"
    }
.end annotation


# static fields
.field private static final APPLICATION_OCTET_STREAM:Ljava/lang/String; = "application/octet-stream"

.field private static final MAXIMUM_CHUNK_SIZE:I = 0x2000000

.field static final PREFERRED_CHUNK_SIZE:I = 0x40000

.field private static final RESUMABLE_FINAL_STATUS:Ljava/lang/String; = "final"

.field private static final TAG:Ljava/lang/String; = "UploadTask"

.field private static final X_GOOG_UPLOAD_URL:Ljava/lang/String; = "X-Goog-Upload-URL"

.field static clock:Lcom/google/android/gms/common/util/Clock;

.field private static final random:Ljava/util/Random;

.field static sleeper:Lcom/google/firebase/storage/internal/Sleeper;


# instance fields
.field private final mAppCheckProvider:Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

.field private final mAuthProvider:Lcom/google/firebase/auth/internal/InternalAuthProvider;

.field private final mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

.field private mCurrentChunkSize:I

.field private volatile mException:Ljava/lang/Exception;

.field private mIsStreamOwned:Z

.field private volatile mMetadata:Lcom/google/firebase/storage/StorageMetadata;

.field private volatile mResultCode:I

.field private mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

.field private volatile mServerException:Ljava/lang/Exception;

.field private volatile mServerStatus:Ljava/lang/String;

.field private final mStorageRef:Lcom/google/firebase/storage/StorageReference;

.field private final mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

.field private final mTotalByteCount:J

.field private volatile mUploadUri:Landroid/net/Uri;

.field private final mUri:Landroid/net/Uri;

.field private volatile maxSleepTime:J

.field private final minimumSleepInterval:I

.field private sleepTime:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 83
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/google/firebase/storage/UploadTask;->random:Ljava/util/Random;

    .line 84
    new-instance v0, Lcom/google/firebase/storage/internal/SleeperImpl;

    invoke-direct {v0}, Lcom/google/firebase/storage/internal/SleeperImpl;-><init>()V

    sput-object v0, Lcom/google/firebase/storage/UploadTask;->sleeper:Lcom/google/firebase/storage/internal/Sleeper;

    .line 85
    invoke-static {}, Lcom/google/android/gms/common/util/DefaultClock;->getInstance()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/storage/UploadTask;->clock:Lcom/google/android/gms/common/util/Clock;

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/storage/StorageReference;Lcom/google/firebase/storage/StorageMetadata;Landroid/net/Uri;Landroid/net/Uri;)V
    .locals 10

    const-string v0, "UploadTask"

    .line 115
    invoke-direct {p0}, Lcom/google/firebase/storage/StorageTask;-><init>()V

    .line 70
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    const/high16 v1, 0x40000

    .line 73
    iput v1, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    const/4 v2, 0x0

    .line 77
    iput-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    .line 78
    iput-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 79
    iput-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const/4 v3, 0x0

    .line 80
    iput v3, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    .line 86
    iput v3, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    const/16 v3, 0x3e8

    .line 87
    iput v3, p0, Lcom/google/firebase/storage/UploadTask;->minimumSleepInterval:I

    .line 116
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getStorage()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object v3

    .line 121
    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 122
    iput-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    .line 123
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getAuthProvider()Lcom/google/firebase/auth/internal/InternalAuthProvider;

    move-result-object v6

    iput-object v6, p0, Lcom/google/firebase/storage/UploadTask;->mAuthProvider:Lcom/google/firebase/auth/internal/InternalAuthProvider;

    .line 124
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getAppCheckProvider()Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    move-result-object v7

    iput-object v7, p0, Lcom/google/firebase/storage/UploadTask;->mAppCheckProvider:Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    .line 125
    iput-object p3, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    .line 127
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getMaxChunkUploadRetry()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/google/firebase/storage/UploadTask;->maxSleepTime:J

    .line 128
    new-instance p2, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    .line 130
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    .line 133
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getMaxUploadRetryTimeMillis()J

    move-result-wide v8

    move-object v4, p2

    invoke-direct/range {v4 .. v9}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;-><init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/InternalAuthProvider;Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;J)V

    iput-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    const-wide/16 v3, -0x1

    .line 137
    :try_start_0
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getStorage()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/storage/FirebaseStorage;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_6

    :try_start_1
    const-string p2, "r"

    .line 140
    invoke-virtual {p1, p3, p2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 142
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getStatSize()J

    move-result-wide v5
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_6

    .line 143
    :try_start_2
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_5

    goto :goto_2

    :catch_0
    move-exception p2

    goto :goto_0

    :catch_1
    move-exception p2

    goto :goto_1

    :catch_2
    move-exception p2

    move-wide v5, v3

    .line 150
    :goto_0
    :try_start_3
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "could not retrieve file size for upload "

    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v0, p3, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    :catch_3
    move-exception p2

    move-wide v5, v3

    :goto_1
    const-string p3, "NullPointerException during file size calculation."

    .line 147
    invoke-static {v0, p3, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    move-wide v5, v3

    .line 153
    :goto_2
    iget-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_5

    if-eqz v2, :cond_2

    cmp-long p1, v5, v3

    if-nez p1, :cond_1

    .line 158
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result p1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_5

    if-ltz p1, :cond_1

    int-to-long v5, p1

    :catch_4
    :cond_1
    move-wide v3, v5

    .line 166
    :try_start_5
    new-instance p1, Ljava/io/BufferedInputStream;

    invoke-direct {p1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_5
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_6

    move-object v2, p1

    goto :goto_4

    :catch_5
    move-exception p1

    move-wide v3, v5

    goto :goto_3

    :catch_6
    move-exception p1

    .line 169
    :goto_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "could not locate file for uploading:"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    invoke-virtual {p3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    :goto_4
    move-wide v5, v3

    .line 172
    :cond_2
    iput-wide v5, p0, Lcom/google/firebase/storage/UploadTask;->mTotalByteCount:J

    .line 173
    new-instance p1, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    invoke-direct {p1, v2, v1}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;-><init>(Ljava/io/InputStream;I)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    const/4 p1, 0x1

    .line 174
    iput-boolean p1, p0, Lcom/google/firebase/storage/UploadTask;->mIsStreamOwned:Z

    .line 175
    iput-object p4, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/storage/StorageReference;Lcom/google/firebase/storage/StorageMetadata;Ljava/io/InputStream;)V
    .locals 12

    .line 178
    invoke-direct {p0}, Lcom/google/firebase/storage/StorageTask;-><init>()V

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    const/high16 v0, 0x40000

    .line 73
    iput v0, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    const/4 v1, 0x0

    .line 77
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    .line 78
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 79
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const/4 v2, 0x0

    .line 80
    iput v2, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    .line 86
    iput v2, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    const/16 v3, 0x3e8

    .line 87
    iput v3, p0, Lcom/google/firebase/storage/UploadTask;->minimumSleepInterval:I

    .line 179
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getStorage()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object v3

    const-wide/16 v4, -0x1

    .line 184
    iput-wide v4, p0, Lcom/google/firebase/storage/UploadTask;->mTotalByteCount:J

    .line 185
    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 186
    iput-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    .line 187
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getAuthProvider()Lcom/google/firebase/auth/internal/InternalAuthProvider;

    move-result-object v8

    iput-object v8, p0, Lcom/google/firebase/storage/UploadTask;->mAuthProvider:Lcom/google/firebase/auth/internal/InternalAuthProvider;

    .line 188
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getAppCheckProvider()Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    move-result-object v9

    iput-object v9, p0, Lcom/google/firebase/storage/UploadTask;->mAppCheckProvider:Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    .line 189
    new-instance p2, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    invoke-direct {p2, p3, v0}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;-><init>(Ljava/io/InputStream;I)V

    iput-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    .line 190
    iput-boolean v2, p0, Lcom/google/firebase/storage/UploadTask;->mIsStreamOwned:Z

    .line 191
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    .line 192
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getMaxChunkUploadRetry()J

    move-result-wide p2

    iput-wide p2, p0, Lcom/google/firebase/storage/UploadTask;->maxSleepTime:J

    .line 193
    new-instance p2, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    .line 195
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 198
    invoke-virtual {v3}, Lcom/google/firebase/storage/FirebaseStorage;->getMaxUploadRetryTimeMillis()J

    move-result-wide v10

    move-object v6, p2

    invoke-direct/range {v6 .. v11}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;-><init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/InternalAuthProvider;Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;J)V

    iput-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/storage/StorageReference;Lcom/google/firebase/storage/StorageMetadata;[B)V
    .locals 11

    .line 89
    invoke-direct {p0}, Lcom/google/firebase/storage/StorageTask;-><init>()V

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    const/high16 v0, 0x40000

    .line 73
    iput v0, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    const/4 v1, 0x0

    .line 77
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    .line 78
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 79
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const/4 v2, 0x0

    .line 80
    iput v2, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    .line 86
    iput v2, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    const/16 v2, 0x3e8

    .line 87
    iput v2, p0, Lcom/google/firebase/storage/UploadTask;->minimumSleepInterval:I

    .line 90
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getStorage()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object v2

    .line 95
    array-length v3, p3

    int-to-long v3, v3

    iput-wide v3, p0, Lcom/google/firebase/storage/UploadTask;->mTotalByteCount:J

    .line 96
    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 97
    iput-object p2, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    .line 98
    invoke-virtual {v2}, Lcom/google/firebase/storage/FirebaseStorage;->getAuthProvider()Lcom/google/firebase/auth/internal/InternalAuthProvider;

    move-result-object v7

    iput-object v7, p0, Lcom/google/firebase/storage/UploadTask;->mAuthProvider:Lcom/google/firebase/auth/internal/InternalAuthProvider;

    .line 99
    invoke-virtual {v2}, Lcom/google/firebase/storage/FirebaseStorage;->getAppCheckProvider()Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    move-result-object v8

    iput-object v8, p0, Lcom/google/firebase/storage/UploadTask;->mAppCheckProvider:Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    .line 100
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    .line 101
    new-instance p1, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    new-instance p2, Ljava/io/ByteArrayInputStream;

    invoke-direct {p2, p3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p1, p2, v0}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;-><init>(Ljava/io/InputStream;I)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    const/4 p1, 0x1

    .line 103
    iput-boolean p1, p0, Lcom/google/firebase/storage/UploadTask;->mIsStreamOwned:Z

    .line 105
    invoke-virtual {v2}, Lcom/google/firebase/storage/FirebaseStorage;->getMaxChunkUploadRetry()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/google/firebase/storage/UploadTask;->maxSleepTime:J

    .line 106
    new-instance p1, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    .line 108
    invoke-virtual {v2}, Lcom/google/firebase/storage/FirebaseStorage;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    .line 111
    invoke-virtual {v2}, Lcom/google/firebase/storage/FirebaseStorage;->getMaxDownloadRetryTimeMillis()J

    move-result-wide v9

    move-object v5, p1

    invoke-direct/range {v5 .. v10}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;-><init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/InternalAuthProvider;Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;J)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/storage/UploadTask;)Lcom/google/firebase/auth/internal/InternalAuthProvider;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/google/firebase/storage/UploadTask;->mAuthProvider:Lcom/google/firebase/auth/internal/InternalAuthProvider;

    return-object p0
.end method

.method static synthetic access$100(Lcom/google/firebase/storage/UploadTask;)Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/google/firebase/storage/UploadTask;->mAppCheckProvider:Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    return-object p0
.end method

.method static synthetic access$200(Lcom/google/firebase/storage/UploadTask;)Lcom/google/firebase/storage/StorageReference;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    return-object p0
.end method

.method private beginResumableUpload()V
    .locals 6

    .line 276
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageMetadata;->getContentType()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 279
    :goto_0
    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    if-eqz v2, :cond_1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 280
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageReference;->getStorage()Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/storage/FirebaseStorage;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 281
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mUri:Landroid/net/Uri;

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 283
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v0, "application/octet-stream"

    .line 286
    :cond_2
    new-instance v2, Lcom/google/firebase/storage/network/ResumableUploadStartRequest;

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 288
    invoke-virtual {v3}, Lcom/google/firebase/storage/StorageReference;->getStorageReferenceUri()Lcom/google/firebase/storage/internal/StorageReferenceUri;

    move-result-object v3

    iget-object v4, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 289
    invoke-virtual {v4}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v4

    .line 290
    iget-object v5, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    if-eqz v5, :cond_3

    iget-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageMetadata;->createJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    :cond_3
    invoke-direct {v2, v3, v4, v1, v0}, Lcom/google/firebase/storage/network/ResumableUploadStartRequest;-><init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 293
    invoke-direct {p0, v2}, Lcom/google/firebase/storage/UploadTask;->sendWithRetry(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result v0

    if-nez v0, :cond_4

    return-void

    :cond_4
    const-string v0, "X-Goog-Upload-URL"

    .line 296
    invoke-virtual {v2, v0}, Lcom/google/firebase/storage/network/NetworkRequest;->getResultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 297
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 298
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    :cond_5
    return-void
.end method

.method private delaySend(Lcom/google/firebase/storage/network/NetworkRequest;)Z
    .locals 6

    const-string v0, "UploadTask"

    const/4 v1, 0x0

    .line 443
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Waiting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " milliseconds"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    sget-object v2, Lcom/google/firebase/storage/UploadTask;->sleeper:Lcom/google/firebase/storage/internal/Sleeper;

    iget v3, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    sget-object v4, Lcom/google/firebase/storage/UploadTask;->random:Ljava/util/Random;

    const/16 v5, 0xfa

    invoke-virtual {v4, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v3, v4

    invoke-interface {v2, v3}, Lcom/google/firebase/storage/internal/Sleeper;->sleep(I)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 452
    invoke-direct {p0, p1}, Lcom/google/firebase/storage/UploadTask;->send(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 458
    iput v1, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    :cond_0
    return p1

    :catch_0
    move-exception p1

    const-string v2, "thread interrupted during exponential backoff."

    .line 446
    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 449
    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    return v1
.end method

.method private isValidHttpResponseCode(I)Z
    .locals 1

    const/16 v0, 0x134

    if-eq p1, v0, :cond_1

    const/16 v0, 0xc8

    if-lt p1, v0, :cond_0

    const/16 v0, 0x12c

    if-ge p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private processResultValid(Lcom/google/firebase/storage/network/NetworkRequest;)Z
    .locals 2

    .line 532
    invoke-virtual {p1}, Lcom/google/firebase/storage/network/NetworkRequest;->getResultCode()I

    move-result v0

    .line 533
    iget-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    invoke-virtual {v1, v0}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;->isRetryableError(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, -0x2

    :cond_0
    iput v0, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    .line 534
    invoke-virtual {p1}, Lcom/google/firebase/storage/network/NetworkRequest;->getException()Ljava/lang/Exception;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const-string v0, "X-Goog-Upload-Status"

    .line 535
    invoke-virtual {p1, v0}, Lcom/google/firebase/storage/network/NetworkRequest;->getResultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mServerStatus:Ljava/lang/String;

    .line 536
    iget p1, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    invoke-direct {p0, p1}, Lcom/google/firebase/storage/UploadTask;->isValidHttpResponseCode(I)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    if-nez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private recoverStatus(Z)Z
    .locals 11

    const-string v0, "UploadTask"

    .line 374
    new-instance v1, Lcom/google/firebase/storage/network/ResumableUploadQueryRequest;

    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 376
    invoke-virtual {v2}, Lcom/google/firebase/storage/StorageReference;->getStorageReferenceUri()Lcom/google/firebase/storage/internal/StorageReferenceUri;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v3}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v3

    iget-object v4, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    invoke-direct {v1, v2, v3, v4}, Lcom/google/firebase/storage/network/ResumableUploadQueryRequest;-><init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;Landroid/net/Uri;)V

    .line 378
    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mServerStatus:Ljava/lang/String;

    const-string v3, "final"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    return v4

    :cond_0
    if-eqz p1, :cond_1

    .line 383
    invoke-direct {p0, v1}, Lcom/google/firebase/storage/UploadTask;->sendWithRetry(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result p1

    if-nez p1, :cond_2

    return v4

    .line 387
    :cond_1
    invoke-direct {p0, v1}, Lcom/google/firebase/storage/UploadTask;->send(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result p1

    if-nez p1, :cond_2

    return v4

    :cond_2
    const-string p1, "X-Goog-Upload-Status"

    .line 392
    invoke-virtual {v1, p1}, Lcom/google/firebase/storage/network/NetworkRequest;->getResultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 393
    new-instance p1, Ljava/io/IOException;

    const-string v0, "The server has terminated the upload session"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    return v4

    :cond_3
    const-string p1, "X-Goog-Upload-Size-Received"

    .line 397
    invoke-virtual {v1, p1}, Lcom/google/firebase/storage/network/NetworkRequest;->getResultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 399
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 400
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    :cond_4
    const-wide/16 v1, 0x0

    .line 404
    :goto_0
    iget-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v5

    cmp-long p1, v5, v1

    if-lez p1, :cond_5

    .line 406
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Unexpected error. The server lost a chunk update."

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    return v4

    :cond_5
    if-gez p1, :cond_7

    .line 410
    :try_start_0
    iget-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    sub-long v7, v1, v5

    long-to-int v3, v7

    invoke-virtual {p1, v3}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->advance(I)I

    move-result p1

    int-to-long v9, p1

    cmp-long p1, v9, v7

    if-eqz p1, :cond_6

    .line 412
    new-instance p1, Ljava/io/IOException;

    const-string v1, "Unexpected end of stream encountered."

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    return v4

    .line 415
    :cond_6
    iget-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1, v5, v6, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result p1

    if-nez p1, :cond_7

    const-string p1, "Somehow, the uploaded bytes changed during an uploaded.  This should nothappen"

    .line 416
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "uploaded bytes changed unexpectedly."

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v4

    :catch_0
    move-exception p1

    const-string v1, "Unable to recover position in Stream during resumable upload"

    .line 424
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 426
    iput-object p1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    return v4

    :cond_7
    const/4 p1, 0x1

    return p1
.end method

.method private send(Lcom/google/firebase/storage/network/NetworkRequest;)Z
    .locals 3

    .line 519
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mAuthProvider:Lcom/google/firebase/auth/internal/InternalAuthProvider;

    .line 520
    invoke-static {v0}, Lcom/google/firebase/storage/internal/Util;->getCurrentAuthToken(Lcom/google/firebase/auth/internal/InternalAuthProvider;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mAppCheckProvider:Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;

    .line 521
    invoke-static {v1}, Lcom/google/firebase/storage/internal/Util;->getCurrentAppCheckToken(Lcom/google/firebase/appcheck/interop/InteropAppCheckTokenProvider;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 522
    invoke-virtual {v2}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 519
    invoke-virtual {p1, v0, v1, v2}, Lcom/google/firebase/storage/network/NetworkRequest;->performRequest(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 523
    invoke-direct {p0, p1}, Lcom/google/firebase/storage/UploadTask;->processResultValid(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result p1

    return p1
.end method

.method private sendWithRetry(Lcom/google/firebase/storage/network/NetworkRequest;)Z
    .locals 1

    .line 527
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    invoke-virtual {v0, p1}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;->sendWithExponentialBackoff(Lcom/google/firebase/storage/network/NetworkRequest;)V

    .line 528
    invoke-direct {p0, p1}, Lcom/google/firebase/storage/UploadTask;->processResultValid(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result p1

    return p1
.end method

.method private serverStateValid()Z
    .locals 3

    .line 357
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mServerStatus:Ljava/lang/String;

    const-string v1, "final"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 358
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    if-nez v0, :cond_0

    .line 359
    new-instance v0, Ljava/io/IOException;

    iget-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const-string v2, "The server has terminated the upload session"

    invoke-direct {v0, v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    :cond_0
    const/16 v0, 0x40

    const/4 v1, 0x0

    .line 362
    invoke-virtual {p0, v0, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    return v1

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private shouldContinue()Z
    .locals 10

    .line 307
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask;->getInternalState()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x80

    if-ne v0, v2, :cond_0

    return v1

    .line 312
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    const/16 v2, 0x40

    if-eqz v0, :cond_1

    .line 313
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 314
    invoke-virtual {p0, v2, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    return v1

    .line 317
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask;->getInternalState()I

    move-result v0

    const/16 v3, 0x20

    if-ne v0, v3, :cond_2

    const/16 v0, 0x100

    .line 318
    invoke-virtual {p0, v0, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    return v1

    .line 321
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask;->getInternalState()I

    move-result v0

    const/16 v3, 0x8

    if-ne v0, v3, :cond_3

    const/16 v0, 0x10

    .line 322
    invoke-virtual {p0, v0, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    return v1

    .line 325
    :cond_3
    invoke-direct {p0}, Lcom/google/firebase/storage/UploadTask;->serverStateValid()Z

    move-result v0

    if-nez v0, :cond_4

    return v1

    .line 328
    :cond_4
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    if-nez v0, :cond_6

    .line 329
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    if-nez v0, :cond_5

    .line 330
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "Unable to obtain an upload URL."

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 332
    :cond_5
    invoke-virtual {p0, v2, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    return v1

    .line 335
    :cond_6
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    if-eqz v0, :cond_7

    .line 336
    invoke-virtual {p0, v2, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    return v1

    .line 340
    :cond_7
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const/4 v3, 0x1

    if-nez v0, :cond_9

    iget v0, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    const/16 v4, 0xc8

    if-lt v0, v4, :cond_9

    iget v0, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    const/16 v4, 0x12c

    if-lt v0, v4, :cond_8

    goto :goto_0

    :cond_8
    const/4 v0, 0x0

    goto :goto_1

    :cond_9
    :goto_0
    const/4 v0, 0x1

    .line 341
    :goto_1
    sget-object v4, Lcom/google/firebase/storage/UploadTask;->clock:Lcom/google/android/gms/common/util/Clock;

    invoke-interface {v4}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/google/firebase/storage/UploadTask;->maxSleepTime:J

    add-long/2addr v4, v6

    .line 342
    sget-object v6, Lcom/google/firebase/storage/UploadTask;->clock:Lcom/google/android/gms/common/util/Clock;

    invoke-interface {v6}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v6

    iget v8, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    int-to-long v8, v8

    add-long/2addr v6, v8

    if-eqz v0, :cond_d

    cmp-long v0, v6, v4

    if-gtz v0, :cond_b

    .line 345
    invoke-direct {p0, v3}, Lcom/google/firebase/storage/UploadTask;->recoverStatus(Z)Z

    move-result v0

    if-nez v0, :cond_a

    goto :goto_2

    .line 351
    :cond_a
    iget v0, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    mul-int/lit8 v0, v0, 0x2

    const/16 v1, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/google/firebase/storage/UploadTask;->sleepTime:I

    goto :goto_3

    .line 346
    :cond_b
    :goto_2
    invoke-direct {p0}, Lcom/google/firebase/storage/UploadTask;->serverStateValid()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 347
    invoke-virtual {p0, v2, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    :cond_c
    return v1

    :cond_d
    :goto_3
    return v3
.end method

.method private uploadChunk()V
    .locals 12

    const-string v0, "UploadTask"

    .line 465
    :try_start_0
    iget-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    iget v2, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    invoke-virtual {v1, v2}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->fill(I)I

    .line 466
    iget v1, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    invoke-virtual {v2}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->available()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 468
    new-instance v2, Lcom/google/firebase/storage/network/ResumableUploadByteRequest;

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 470
    invoke-virtual {v3}, Lcom/google/firebase/storage/StorageReference;->getStorageReferenceUri()Lcom/google/firebase/storage/internal/StorageReferenceUri;

    move-result-object v4

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 471
    invoke-virtual {v3}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v5

    iget-object v6, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    .line 473
    invoke-virtual {v3}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->get()[B

    move-result-object v7

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    .line 474
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    .line 476
    invoke-virtual {v3}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->isFinished()Z

    move-result v11

    move-object v3, v2

    move v10, v1

    invoke-direct/range {v3 .. v11}, Lcom/google/firebase/storage/network/ResumableUploadByteRequest;-><init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;Landroid/net/Uri;[BJIZ)V

    .line 478
    invoke-direct {p0, v2}, Lcom/google/firebase/storage/UploadTask;->delaySend(Lcom/google/firebase/storage/network/NetworkRequest;)Z

    move-result v3

    if-nez v3, :cond_0

    const/high16 v1, 0x40000

    .line 479
    iput v1, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    .line 480
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Resetting chunk size to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 484
    :cond_0
    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    int-to-long v4, v1

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->getAndAdd(J)J

    .line 486
    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    invoke-virtual {v3}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->isFinished()Z

    move-result v3

    if-nez v3, :cond_1

    .line 487
    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    invoke-virtual {v2, v1}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->advance(I)I

    .line 488
    iget v1, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    const/high16 v2, 0x2000000

    if-ge v1, v2, :cond_2

    mul-int/lit8 v1, v1, 0x2

    .line 489
    iput v1, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    .line 490
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Increasing chunk size to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/firebase/storage/UploadTask;->mCurrentChunkSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 494
    :cond_1
    :try_start_1
    new-instance v1, Lcom/google/firebase/storage/StorageMetadata$Builder;

    .line 495
    invoke-virtual {v2}, Lcom/google/firebase/storage/network/NetworkRequest;->getResultBody()Lorg/json/JSONObject;

    move-result-object v3

    iget-object v4, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/storage/StorageMetadata$Builder;-><init>(Lorg/json/JSONObject;Lcom/google/firebase/storage/StorageReference;)V

    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->build()Lcom/google/firebase/storage/StorageMetadata;

    move-result-object v1

    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 505
    :try_start_2
    invoke-virtual {p0, v1, v2}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    const/16 v1, 0x80

    .line 506
    invoke-virtual {p0, v1, v2}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    goto :goto_0

    :catch_0
    move-exception v1

    .line 497
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to parse resulting metadata from upload:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    invoke-virtual {v2}, Lcom/google/firebase/storage/network/NetworkRequest;->getRawResult()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 497
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 502
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    return-void

    :catch_1
    move-exception v1

    const-string v2, "Unable to read bytes for uploading"

    .line 509
    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 510
    iput-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method getStorage()Lcom/google/firebase/storage/StorageReference;
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    return-object v0
.end method

.method getTotalByteCount()J
    .locals 2

    .line 210
    iget-wide v0, p0, Lcom/google/firebase/storage/UploadTask;->mTotalByteCount:J

    return-wide v0
.end method

.method protected onCanceled()V
    .locals 4

    .line 541
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    invoke-virtual {v0}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;->cancel()V

    .line 544
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 545
    new-instance v0, Lcom/google/firebase/storage/network/ResumableUploadCancelRequest;

    iget-object v1, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    .line 547
    invoke-virtual {v1}, Lcom/google/firebase/storage/StorageReference;->getStorageReferenceUri()Lcom/google/firebase/storage/internal/StorageReferenceUri;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v2}, Lcom/google/firebase/storage/StorageReference;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firebase/storage/network/ResumableUploadCancelRequest;-><init>(Lcom/google/firebase/storage/internal/StorageReferenceUri;Lcom/google/firebase/FirebaseApp;Landroid/net/Uri;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 552
    invoke-static {}, Lcom/google/firebase/storage/StorageTaskScheduler;->getInstance()Lcom/google/firebase/storage/StorageTaskScheduler;

    move-result-object v1

    new-instance v2, Lcom/google/firebase/storage/UploadTask$1;

    invoke-direct {v2, p0, v0}, Lcom/google/firebase/storage/UploadTask$1;-><init>(Lcom/google/firebase/storage/UploadTask;Lcom/google/firebase/storage/network/NetworkRequest;)V

    .line 553
    invoke-virtual {v1, v2}, Lcom/google/firebase/storage/StorageTaskScheduler;->scheduleCommand(Ljava/lang/Runnable;)V

    .line 564
    :cond_1
    sget-object v0, Lcom/google/android/gms/common/api/Status;->RESULT_CANCELED:Lcom/google/android/gms/common/api/Status;

    invoke-static {v0}, Lcom/google/firebase/storage/StorageException;->fromErrorStatus(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/storage/StorageException;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 566
    invoke-super {p0}, Lcom/google/firebase/storage/StorageTask;->onCanceled()V

    return-void
.end method

.method protected resetState()V
    .locals 2

    const/4 v0, 0x0

    .line 267
    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 268
    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    const/4 v1, 0x0

    .line 269
    iput v1, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    .line 270
    iput-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mServerStatus:Ljava/lang/String;

    return-void
.end method

.method run()V
    .locals 5

    .line 222
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mSender:Lcom/google/firebase/storage/internal/ExponentialBackoffSender;

    invoke-virtual {v0}, Lcom/google/firebase/storage/internal/ExponentialBackoffSender;->reset()V

    const/4 v0, 0x4

    const/4 v1, 0x0

    .line 223
    invoke-virtual {p0, v0, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    move-result v2

    const-string v3, "UploadTask"

    if-nez v2, :cond_0

    const-string v0, "The upload cannot continue as it is not in a valid state."

    .line 225
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 229
    :cond_0
    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mStorageRef:Lcom/google/firebase/storage/StorageReference;

    invoke-virtual {v2}, Lcom/google/firebase/storage/StorageReference;->getParent()Lcom/google/firebase/storage/StorageReference;

    move-result-object v2

    if-nez v2, :cond_1

    .line 230
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "Cannot upload to getRoot. You should upload to a storage location such as .getReference(\'image.png\').putFile..."

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    .line 236
    :cond_1
    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    if-eqz v2, :cond_2

    return-void

    .line 240
    :cond_2
    iget-object v2, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    if-nez v2, :cond_3

    .line 241
    invoke-direct {p0}, Lcom/google/firebase/storage/UploadTask;->beginResumableUpload()V

    goto :goto_0

    .line 243
    :cond_3
    invoke-direct {p0, v1}, Lcom/google/firebase/storage/UploadTask;->recoverStatus(Z)Z

    .line 246
    :goto_0
    invoke-direct {p0}, Lcom/google/firebase/storage/UploadTask;->shouldContinue()Z

    move-result v2

    :cond_4
    :goto_1
    if-eqz v2, :cond_5

    .line 248
    invoke-direct {p0}, Lcom/google/firebase/storage/UploadTask;->uploadChunk()V

    .line 249
    invoke-direct {p0}, Lcom/google/firebase/storage/UploadTask;->shouldContinue()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 252
    invoke-virtual {p0, v0, v1}, Lcom/google/firebase/storage/UploadTask;->tryChangeState(IZ)Z

    goto :goto_1

    .line 256
    :cond_5
    iget-boolean v0, p0, Lcom/google/firebase/storage/UploadTask;->mIsStreamOwned:Z

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask;->getInternalState()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_6

    .line 258
    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mStreamBuffer:Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;

    invoke-virtual {v0}, Lcom/google/firebase/storage/internal/AdaptiveStreamBuffer;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    const-string v1, "Unable to close stream."

    .line 260
    invoke-static {v3, v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_6
    :goto_2
    return-void
.end method

.method protected schedule()V
    .locals 2

    .line 215
    invoke-static {}, Lcom/google/firebase/storage/StorageTaskScheduler;->getInstance()Lcom/google/firebase/storage/StorageTaskScheduler;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask;->getRunnable()Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageTaskScheduler;->scheduleUpload(Ljava/lang/Runnable;)V

    return-void
.end method

.method bridge synthetic snapStateImpl()Lcom/google/firebase/storage/StorageTask$ProvideError;
    .locals 1

    .line 57
    invoke-virtual {p0}, Lcom/google/firebase/storage/UploadTask;->snapStateImpl()Lcom/google/firebase/storage/UploadTask$TaskSnapshot;

    move-result-object v0

    return-object v0
.end method

.method snapStateImpl()Lcom/google/firebase/storage/UploadTask$TaskSnapshot;
    .locals 9

    .line 572
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mException:Ljava/lang/Exception;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mServerException:Ljava/lang/Exception;

    .line 573
    :goto_0
    new-instance v8, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;

    iget v1, p0, Lcom/google/firebase/storage/UploadTask;->mResultCode:I

    .line 574
    invoke-static {v0, v1}, Lcom/google/firebase/storage/StorageException;->fromExceptionAndHttpCode(Ljava/lang/Throwable;I)Lcom/google/firebase/storage/StorageException;

    move-result-object v3

    iget-object v0, p0, Lcom/google/firebase/storage/UploadTask;->mBytesUploaded:Ljava/util/concurrent/atomic/AtomicLong;

    .line 575
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    iget-object v6, p0, Lcom/google/firebase/storage/UploadTask;->mUploadUri:Landroid/net/Uri;

    iget-object v7, p0, Lcom/google/firebase/storage/UploadTask;->mMetadata:Lcom/google/firebase/storage/StorageMetadata;

    move-object v1, v8

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/google/firebase/storage/UploadTask$TaskSnapshot;-><init>(Lcom/google/firebase/storage/UploadTask;Ljava/lang/Exception;JLandroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)V

    return-object v8
.end method
