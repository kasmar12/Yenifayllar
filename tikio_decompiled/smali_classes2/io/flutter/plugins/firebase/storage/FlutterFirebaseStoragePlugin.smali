.class public Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;
.super Ljava/lang/Object;
.source "FlutterFirebaseStoragePlugin.java"

# interfaces
.implements Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final DEFAULT_ERROR_CODE:Ljava/lang/String; = "firebase_storage"

.field static final STORAGE_METHOD_CHANNEL_NAME:Ljava/lang/String; = "plugins.flutter.io/firebase_storage"

.field static final STORAGE_TASK_EVENT_NAME:Ljava/lang/String; = "taskEvent"


# instance fields
.field private channel:Lio/flutter/plugin/common/MethodChannel;

.field private final eventChannels:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/flutter/plugin/common/EventChannel;",
            ">;"
        }
    .end annotation
.end field

.field private messenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final streamHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->eventChannels:Ljava/util/Map;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->streamHandlers:Ljava/util/Map;

    return-void
.end method

.method private convertToPigeonReference(Lcom/google/firebase/storage/StorageReference;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;
    .locals 2

    .line 194
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;-><init>()V

    .line 195
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getBucket()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;->setBucket(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;

    move-result-object v0

    .line 196
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;->setFullPath(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;

    move-result-object v0

    .line 197
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;->setName(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;

    move-result-object p1

    .line 198
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference$Builder;->build()Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    move-result-object p1

    return-object p1
.end method

.method static getExceptionDetails(Ljava/lang/Exception;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Exception;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 51
    invoke-static {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 54
    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;->code:Ljava/lang/String;

    const-string v2, "code"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v1, "message"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private getReferenceFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;)Lcom/google/firebase/storage/StorageReference;
    .locals 0

    .line 188
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 189
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    return-object p1
.end method

.method private getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;
    .locals 3

    .line 180
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;->getAppName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    .line 182
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "gs://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;->getBucket()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/google/firebase/storage/FirebaseStorage;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    return-object p1
.end method

.method private initInstance(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2

    const-string v0, "plugins.flutter.io/firebase_storage"

    .line 144
    invoke-static {v0, p0}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->registerPlugin(Ljava/lang/String;Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;)V

    .line 145
    new-instance v1, Lio/flutter/plugin/common/MethodChannel;

    invoke-direct {v1, p1, v0}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 146
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    .line 147
    iput-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method

.method static synthetic lambda$getPluginConstantsForFirebaseApp$7(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 677
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 678
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$referenceDelete$0(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 242
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 243
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 246
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    .line 245
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$referenceGetData$2(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 285
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 286
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    .line 287
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 290
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    .line 289
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$referenceGetDownloadURL$1(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 263
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    .line 265
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 268
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    .line 267
    invoke-interface {p0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static parseMetadataToMap(Lcom/google/firebase/storage/StorageMetadata;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/storage/StorageMetadata;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 66
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 67
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 68
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "name"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getBucket()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 72
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getBucket()Ljava/lang/String;

    move-result-object v1

    const-string v2, "bucket"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    :cond_2
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getGeneration()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 76
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getGeneration()Ljava/lang/String;

    move-result-object v1

    const-string v2, "generation"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    :cond_3
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getMetadataGeneration()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 80
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getMetadataGeneration()Ljava/lang/String;

    move-result-object v1

    const-string v2, "metadataGeneration"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    :cond_4
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fullPath"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getSizeBytes()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "size"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getCreationTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "creationTimeMillis"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getUpdatedTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "updatedTimeMillis"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getMd5Hash()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 92
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getMd5Hash()Ljava/lang/String;

    move-result-object v1

    const-string v2, "md5Hash"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    :cond_5
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getCacheControl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 96
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getCacheControl()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cacheControl"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    :cond_6
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentDisposition()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 100
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentDisposition()Ljava/lang/String;

    move-result-object v1

    const-string v2, "contentDisposition"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    :cond_7
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentEncoding()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 104
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentEncoding()Ljava/lang/String;

    move-result-object v1

    const-string v2, "contentEncoding"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_8
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentLanguage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 108
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentLanguage()Ljava/lang/String;

    move-result-object v1

    const-string v2, "contentLanguage"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_9
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_a

    .line 112
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getContentType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "contentType"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    :cond_a
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 116
    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageMetadata;->getCustomMetadataKeys()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 117
    invoke-virtual {p0, v3}, Lcom/google/firebase/storage/StorageMetadata;->getCustomMetadata(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_b

    const-string v4, ""

    .line 118
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 120
    :cond_b
    invoke-virtual {p0, v3}, Lcom/google/firebase/storage/StorageMetadata;->getCustomMetadata(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_c
    const-string p0, "customMetadata"

    .line 123
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;
    .locals 2

    .line 151
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 152
    invoke-direct {p0, p1, v0, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->registerEventChannel(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private registerEventChannel(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;
    .locals 2

    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 158
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    iget-object v1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-direct {v0, v1, p1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 159
    invoke-virtual {v0, p3}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 160
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method private removeEventListeners()V
    .locals 4

    .line 167
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 168
    iget-object v3, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/common/EventChannel;

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    goto :goto_0

    .line 170
    :cond_0
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 172
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 173
    iget-object v3, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-interface {v1, v2}, Lio/flutter/plugin/common/EventChannel$StreamHandler;->onCancel(Ljava/lang/Object;)V

    goto :goto_1

    .line 175
    :cond_1
    iget-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method private stringToByteData(Ljava/lang/String;I)[B
    .locals 1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_1

    const/4 v0, 0x2

    if-eq p2, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const/16 p2, 0x8

    .line 666
    invoke-static {p1, p2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p2, 0x0

    .line 664
    invoke-static {p1, p2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method convertToPigeonListResult(Lcom/google/firebase/storage/ListResult;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;
    .locals 4

    .line 327
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 328
    invoke-virtual {p1}, Lcom/google/firebase/storage/ListResult;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/storage/StorageReference;

    .line 329
    invoke-direct {p0, v2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonReference(Lcom/google/firebase/storage/StorageReference;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 331
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 332
    invoke-virtual {p1}, Lcom/google/firebase/storage/ListResult;->getPrefixes()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/storage/StorageReference;

    .line 333
    invoke-direct {p0, v3}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonReference(Lcom/google/firebase/storage/StorageReference;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 335
    :cond_1
    new-instance v2, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;

    invoke-direct {v2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;-><init>()V

    .line 336
    invoke-virtual {v2, v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->setItems(Ljava/util/List;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;

    move-result-object v0

    .line 337
    invoke-virtual {p1}, Lcom/google/firebase/storage/ListResult;->getPageToken()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->setPageToken(Ljava/lang/String;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;

    move-result-object p1

    .line 338
    invoke-virtual {p1, v1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->setPrefixs(Ljava/util/List;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;

    move-result-object p1

    .line 339
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult$Builder;->build()Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    move-result-object p1

    return-object p1
.end method

.method convertToPigeonMetaData(Lcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;
    .locals 1

    .line 297
    new-instance v0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData$Builder;-><init>()V

    .line 298
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->parseMetadataToMap(Lcom/google/firebase/storage/StorageMetadata;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData$Builder;->setMetadata(Ljava/util/Map;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData$Builder;

    move-result-object p1

    .line 299
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData$Builder;->build()Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    move-result-object p1

    return-object p1
.end method

.method public didReinitializeFirebaseCore()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 686
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 687
    sget-object v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0, v0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 694
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method getMetaDataFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;)Lcom/google/firebase/storage/StorageMetadata;
    .locals 3

    .line 396
    new-instance v0, Lcom/google/firebase/storage/StorageMetadata$Builder;

    invoke-direct {v0}, Lcom/google/firebase/storage/StorageMetadata$Builder;-><init>()V

    .line 398
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->getCacheControl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->setCacheControl(Ljava/lang/String;)Lcom/google/firebase/storage/StorageMetadata$Builder;

    move-result-object v0

    .line 399
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->getContentDisposition()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->setContentDisposition(Ljava/lang/String;)Lcom/google/firebase/storage/StorageMetadata$Builder;

    move-result-object v0

    .line 400
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->getContentEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->setContentEncoding(Ljava/lang/String;)Lcom/google/firebase/storage/StorageMetadata$Builder;

    move-result-object v0

    .line 401
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->getContentLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->setContentLanguage(Ljava/lang/String;)Lcom/google/firebase/storage/StorageMetadata$Builder;

    move-result-object v0

    .line 402
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->getContentType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->setContentType(Ljava/lang/String;)Lcom/google/firebase/storage/StorageMetadata$Builder;

    move-result-object v0

    .line 404
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;->getCustomMetadata()Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 406
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 407
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lcom/google/firebase/storage/StorageMetadata$Builder;->setCustomMetadata(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/storage/StorageMetadata$Builder;

    goto :goto_0

    .line 411
    :cond_0
    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageMetadata$Builder;->build()Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p1

    return-object p1
.end method

.method public getPluginConstantsForFirebaseApp(Lcom/google/firebase/FirebaseApp;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/FirebaseApp;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 674
    new-instance p1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 675
    sget-object v0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda7;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 681
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getReferencebyPath(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            ">;)V"
        }
    .end annotation

    .line 210
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 212
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonReference(Lcom/google/firebase/storage/StorageReference;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;

    move-result-object p1

    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic lambda$didReinitializeFirebaseCore$8$io-flutter-plugins-firebase-storage-FlutterFirebaseStoragePlugin(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    .line 689
    invoke-static {}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelInProgressTasks()V

    const/4 v0, 0x0

    .line 690
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    .line 691
    invoke-direct {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->removeEventListeners()V

    return-void
.end method

.method public synthetic lambda$referenceGetMetaData$3$io-flutter-plugins-firebase-storage-FlutterFirebaseStoragePlugin(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 315
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/storage/StorageMetadata;

    .line 317
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonMetaData(Lcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 320
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-static {p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p2

    .line 319
    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public synthetic lambda$referenceList$4$io-flutter-plugins-firebase-storage-FlutterFirebaseStoragePlugin(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 361
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/storage/ListResult;

    .line 363
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonListResult(Lcom/google/firebase/storage/ListResult;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 366
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-static {p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p2

    .line 365
    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public synthetic lambda$referenceListAll$5$io-flutter-plugins-firebase-storage-FlutterFirebaseStoragePlugin(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 384
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 385
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/storage/ListResult;

    .line 386
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonListResult(Lcom/google/firebase/storage/ListResult;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 389
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-static {p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p2

    .line 388
    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public synthetic lambda$referenceUpdateMetadata$6$io-flutter-plugins-firebase-storage-FlutterFirebaseStoragePlugin(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 428
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 429
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/storage/StorageMetadata;

    .line 430
    invoke-virtual {p0, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->convertToPigeonMetaData(Lcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 433
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    invoke-static {p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p2

    .line 432
    invoke-interface {p1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 129
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->initInstance(Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 134
    invoke-static {}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->cancelInProgressTasks()V

    .line 135
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 137
    iget-object p1, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FirebaseStorageHostApi;)V

    .line 138
    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 139
    iput-object v0, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 140
    invoke-direct {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->removeEventListeners()V

    return-void
.end method

.method public referenceDelete(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 236
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 237
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 239
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->delete()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda4;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    .line 240
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public referenceDownloadFile(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 527
    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getReferenceFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 530
    invoke-virtual {p4}, Ljava/lang/Long;->intValue()I

    move-result p2

    new-instance p4, Ljava/io/File;

    invoke-direct {p4, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 529
    invoke-static {p2, p1, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->downloadFile(ILcom/google/firebase/storage/StorageReference;Ljava/io/File;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    .line 533
    :try_start_0
    iget-object p2, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->startTaskWithMethodChannel(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    move-result-object p1

    const-string p2, "plugins.flutter.io/firebase_storage/taskEvent"

    .line 535
    invoke-direct {p0, p2, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 534
    invoke-interface {p5, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 538
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p5, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public referenceGetData(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "[B>;)V"
        }
    .end annotation

    .line 279
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 280
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 282
    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/storage/StorageReference;->getBytes(J)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda5;

    invoke-direct {p2, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    .line 283
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public referenceGetDownloadURL(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 256
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 258
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 260
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getDownloadUrl()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda6;

    invoke-direct {p2, p3}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    .line 261
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public referenceGetMetaData(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;",
            ">;)V"
        }
    .end annotation

    .line 309
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 310
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 312
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->getMetadata()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, p3}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    .line 313
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public referenceList(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;",
            ">;)V"
        }
    .end annotation

    .line 350
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 351
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 353
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->getPageToken()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 355
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->getMaxResults()Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p2

    invoke-virtual {p3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->getPageToken()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/storage/StorageReference;->list(ILjava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    goto :goto_0

    .line 357
    :cond_0
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListOptions;->getMaxResults()Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/StorageReference;->list(I)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    .line 359
    :goto_0
    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public referenceListAll(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonListResult;",
            ">;)V"
        }
    .end annotation

    .line 378
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 379
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 381
    invoke-virtual {p1}, Lcom/google/firebase/storage/StorageReference;->listAll()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0, p3}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    .line 382
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public referencePutData(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;[BLio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "[B",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 447
    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getReferenceFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 448
    invoke-virtual {p0, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getMetaDataFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;)Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p2

    .line 452
    invoke-virtual {p5}, Ljava/lang/Long;->intValue()I

    move-result p4

    .line 451
    invoke-static {p4, p1, p3, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->uploadBytes(ILcom/google/firebase/storage/StorageReference;[BLcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    .line 454
    :try_start_0
    iget-object p2, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->startTaskWithMethodChannel(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    move-result-object p1

    const-string p2, "plugins.flutter.io/firebase_storage/taskEvent"

    .line 456
    invoke-direct {p0, p2, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 455
    invoke-interface {p6, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 459
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p6, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public referencePutFile(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/String;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 502
    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getReferenceFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 503
    invoke-virtual {p0, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getMetaDataFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;)Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p2

    .line 507
    invoke-virtual {p5}, Ljava/lang/Long;->intValue()I

    move-result p4

    new-instance p5, Ljava/io/File;

    invoke-direct {p5, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p3

    .line 506
    invoke-static {p4, p1, p3, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->uploadFile(ILcom/google/firebase/storage/StorageReference;Landroid/net/Uri;Lcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    .line 510
    :try_start_0
    iget-object p2, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->startTaskWithMethodChannel(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    move-result-object p1

    const-string p2, "plugins.flutter.io/firebase_storage/taskEvent"

    .line 512
    invoke-direct {p0, p2, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 511
    invoke-interface {p6, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 515
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p6, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public referencePutString(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 473
    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getReferenceFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 474
    invoke-virtual {p0, p5}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getMetaDataFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;)Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p2

    .line 478
    invoke-virtual {p6}, Ljava/lang/Long;->intValue()I

    move-result p5

    .line 480
    invoke-virtual {p4}, Ljava/lang/Long;->intValue()I

    move-result p4

    invoke-direct {p0, p3, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->stringToByteData(Ljava/lang/String;I)[B

    move-result-object p3

    .line 477
    invoke-static {p5, p1, p3, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->uploadBytes(ILcom/google/firebase/storage/StorageReference;[BLcom/google/firebase/storage/StorageMetadata;)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    .line 484
    :try_start_0
    iget-object p2, p0, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1, p2}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->startTaskWithMethodChannel(Lio/flutter/plugin/common/MethodChannel;)Lio/flutter/plugins/firebase/storage/TaskStateChannelStreamHandler;

    move-result-object p1

    const-string p2, "plugins.flutter.io/firebase_storage/taskEvent"

    .line 486
    invoke-direct {p0, p2, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 485
    invoke-interface {p7, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 489
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p7, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public referenceUpdateMetadata(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonFullMetaData;",
            ">;)V"
        }
    .end annotation

    .line 422
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 423
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageReference;->getFullPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/FirebaseStorage;->getReference(Ljava/lang/String;)Lcom/google/firebase/storage/StorageReference;

    move-result-object p1

    .line 425
    invoke-virtual {p0, p3}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getMetaDataFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonSettableMetadata;)Lcom/google/firebase/storage/StorageMetadata;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/google/firebase/storage/StorageReference;->updateMetadata(Lcom/google/firebase/storage/StorageMetadata;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0, p4}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V

    .line 426
    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setMaxDownloadRetryTime(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 656
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 657
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/storage/FirebaseStorage;->setMaxDownloadRetryTimeMillis(J)V

    const/4 p1, 0x0

    .line 658
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public setMaxOperationRetryTime(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 636
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 637
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/storage/FirebaseStorage;->setMaxOperationRetryTimeMillis(J)V

    const/4 p1, 0x0

    .line 638
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public setMaxUploadRetryTime(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 646
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 647
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/storage/FirebaseStorage;->setMaxUploadRetryTimeMillis(J)V

    const/4 p1, 0x0

    .line 648
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public taskCancel(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 609
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getInProgressTaskForHandle(I)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    if-nez p1, :cond_0

    .line 611
    new-instance p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    const/4 p2, 0x0

    const-string v0, "unknown"

    const-string v1, "Cancel operation was called on a task which does not exist."

    invoke-direct {p1, v0, v1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 618
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getAndroidTask()Lcom/google/firebase/storage/StorageTask;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/firebase/storage/StorageTask;->cancel()Z

    move-result p2

    .line 619
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "status"

    .line 620
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_1

    const-string p2, "snapshot"

    .line 623
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getSnapshot()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->parseTaskSnapshot(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    .line 622
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    :cond_1
    invoke-interface {p3, v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 627
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public taskPause(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 550
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getInProgressTaskForHandle(I)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    if-nez p1, :cond_0

    .line 553
    new-instance p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    const/4 p2, 0x0

    const-string v0, "unknown"

    const-string v1, "Pause operation was called on a task which does not exist."

    invoke-direct {p1, v0, v1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 559
    :cond_0
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 561
    :try_start_0
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getAndroidTask()Lcom/google/firebase/storage/StorageTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/storage/StorageTask;->pause()Z

    move-result v0

    const-string v1, "status"

    .line 562
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v0, :cond_1

    const-string v0, "snapshot"

    .line 565
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getSnapshot()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->parseTaskSnapshot(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    .line 564
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    :cond_1
    invoke-interface {p3, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 569
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public taskResume(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 580
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getInProgressTaskForHandle(I)Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;

    move-result-object p1

    if-nez p1, :cond_0

    .line 583
    new-instance p1, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    const/4 p2, 0x0

    const-string v0, "unknown"

    const-string v1, "Resume operation was called on a task which does not exist."

    invoke-direct {p1, v0, v1, p2}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 590
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getAndroidTask()Lcom/google/firebase/storage/StorageTask;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/firebase/storage/StorageTask;->resume()Z

    move-result p2

    .line 591
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "status"

    .line 592
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_1

    const-string p2, "snapshot"

    .line 595
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->getSnapshot()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageTask;->parseTaskSnapshot(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p1

    .line 594
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 597
    :cond_1
    invoke-interface {p3, v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 599
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public useStorageEmulator(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 222
    :try_start_0
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStoragePlugin;->getStorageFromPigeon(Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$PigeonStorageFirebaseApp;)Lcom/google/firebase/storage/FirebaseStorage;

    move-result-object p1

    .line 223
    invoke-virtual {p3}, Ljava/lang/Long;->intValue()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Lcom/google/firebase/storage/FirebaseStorage;->useEmulator(Ljava/lang/String;I)V

    const/4 p1, 0x0

    .line 224
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 226
    invoke-static {p1}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    move-result-object p1

    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$Result;->error(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
