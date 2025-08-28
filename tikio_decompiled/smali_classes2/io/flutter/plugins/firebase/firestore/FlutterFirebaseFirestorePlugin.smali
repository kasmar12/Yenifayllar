.class public Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;
.super Ljava/lang/Object;
.source "FlutterFirebaseFirestorePlugin.java"

# interfaces
.implements Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;
.implements Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApi;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DEFAULT_ERROR_CODE:Ljava/lang/String; = "firebase_firestore"

.field private static final METHOD_CHANNEL_NAME:Ljava/lang/String; = "plugins.flutter.io/firebase_firestore"

.field protected static final firestoreInstanceCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/google/firebase/firestore/FirebaseFirestore;",
            "Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;",
            ">;"
        }
    .end annotation
.end field

.field public static final serverTimestampBehaviorHashMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final MESSAGE_CODEC:Lio/flutter/plugin/common/StandardMethodCodec;

.field private final activity:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

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

.field private final transactionHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/streamhandler/OnTransactionResultListener;",
            ">;"
        }
    .end annotation
.end field

.field private final transactions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/google/firebase/firestore/Transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->serverTimestampBehaviorHashMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    new-instance v0, Lio/flutter/plugin/common/StandardMethodCodec;

    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;->INSTANCE:Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreMessageCodec;

    invoke-direct {v0, v1}, Lio/flutter/plugin/common/StandardMethodCodec;-><init>(Lio/flutter/plugin/common/StandardMessageCodec;)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->MESSAGE_CODEC:Lio/flutter/plugin/common/StandardMethodCodec;

    .line 78
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->activity:Ljava/util/concurrent/atomic/AtomicReference;

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactions:Ljava/util/Map;

    .line 81
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->eventChannels:Ljava/util/Map;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->streamHandlers:Ljava/util/Map;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactionHandlers:Ljava/util/Map;

    return-void
.end method

.method private attachToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    .line 162
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->activity:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method private static destroyCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;)V
    .locals 2

    .line 120
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    monitor-enter v0

    .line 121
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    if-eqz v1, :cond_0

    .line 123
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private detachToActivity()V
    .locals 2

    .line 166
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->activity:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-void
.end method

.method protected static getCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;
    .locals 1

    .line 91
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    monitor-enter v0

    .line 92
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 93
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;
    .locals 3

    .line 309
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    monitor-enter v0

    .line 311
    :try_start_0
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getDatabaseURL()Ljava/lang/String;

    move-result-object v2

    .line 310
    invoke-static {v1, v2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreInstanceByNameAndDatabaseUrl(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 314
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getDatabaseURL()Ljava/lang/String;

    move-result-object p0

    .line 313
    invoke-static {v1, p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreInstanceByNameAndDatabaseUrl(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    monitor-exit v0

    return-object p0

    .line 317
    :cond_0
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v1

    .line 318
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getDatabaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/firebase/firestore/FirebaseFirestore;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v1

    .line 319
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getSettingsFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/FirebaseFirestore;->setFirestoreSettings(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V

    .line 322
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getDatabaseURL()Ljava/lang/String;

    move-result-object p0

    .line 321
    invoke-static {v1, p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->setCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)V

    .line 323
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    .line 324
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method protected static getFirestoreInstanceByNameAndDatabaseUrl(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestore;
    .locals 3

    .line 110
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 111
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->getInstance()Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/FirebaseFirestore;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;->getDatabaseURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 113
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/FirebaseFirestore;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static getSettingsFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings;
    .locals 7

    .line 282
    new-instance v0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    invoke-direct {v0}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;-><init>()V

    .line 283
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 284
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setHost(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    .line 286
    :cond_0
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getSslEnabled()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 287
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getSslEnabled()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setSslEnabled(Z)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    .line 289
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getPersistenceEnabled()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 290
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getPersistenceEnabled()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 291
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;->getSettings()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    move-result-object p0

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->getCacheSizeBytes()Ljava/lang/Long;

    move-result-object p0

    const-wide/32 v1, 0x6400000

    .line 294
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    if-eqz p0, :cond_2

    .line 295
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v4

    if-eqz v6, :cond_2

    goto :goto_0

    :cond_2
    move-object p0, v1

    .line 299
    :goto_0
    invoke-static {}, Lcom/google/firebase/firestore/PersistentCacheSettings;->newBuilder()Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;->setSizeBytes(J)Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/firebase/firestore/PersistentCacheSettings$Builder;->build()Lcom/google/firebase/firestore/PersistentCacheSettings;

    move-result-object p0

    .line 298
    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setLocalCacheSettings(Lcom/google/firebase/firestore/LocalCacheSettings;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    goto :goto_1

    .line 301
    :cond_3
    invoke-static {}, Lcom/google/firebase/firestore/MemoryCacheSettings;->newBuilder()Lcom/google/firebase/firestore/MemoryCacheSettings$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/firebase/firestore/MemoryCacheSettings$Builder;->build()Lcom/google/firebase/firestore/MemoryCacheSettings;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->setLocalCacheSettings(Lcom/google/firebase/firestore/LocalCacheSettings;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;

    .line 304
    :cond_4
    :goto_1
    invoke-virtual {v0}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->build()Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    move-result-object p0

    return-object p0
.end method

.method private initInstance(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 0

    .line 170
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    const-string p1, "plugins.flutter.io/firebase_firestore"

    .line 172
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/core/FlutterFirebasePluginRegistry;->registerPlugin(Ljava/lang/String;Lio/flutter/plugins/firebase/core/FlutterFirebasePlugin;)V

    .line 174
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApi$-CC;->setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApi;)V

    return-void
.end method

.method static synthetic lambda$aggregateQuery$17(Lcom/google/firebase/firestore/AggregateQuery;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 4

    .line 780
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseAggregateSource(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;)Lcom/google/firebase/firestore/AggregateSource;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/AggregateQuery;->get(Lcom/google/firebase/firestore/AggregateSource;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/AggregateQuerySnapshot;

    .line 782
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 784
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;

    .line 785
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$AggregateType:[I

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getType()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    move-result-object v2

    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 810
    :cond_0
    new-instance v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;-><init>()V

    .line 812
    sget-object v2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;->AVERAGE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 815
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getField()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/firebase/firestore/AggregateField;->average(Ljava/lang/String;)Lcom/google/firebase/firestore/AggregateField$AverageAggregateField;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->get(Lcom/google/firebase/firestore/AggregateField$AverageAggregateField;)Ljava/lang/Double;

    move-result-object v2

    .line 814
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Ljava/lang/Double;

    .line 813
    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setValue(Ljava/lang/Double;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 816
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getField()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setField(Ljava/lang/String;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 818
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 796
    :cond_1
    new-instance v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;-><init>()V

    .line 798
    sget-object v2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;->SUM:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 802
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getField()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/google/firebase/firestore/AggregateField;->sum(Ljava/lang/String;)Lcom/google/firebase/firestore/AggregateField$SumAggregateField;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->get(Lcom/google/firebase/firestore/AggregateField;)Ljava/lang/Object;

    move-result-object v2

    .line 801
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v2, Ljava/lang/Number;

    .line 803
    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 800
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 799
    invoke-virtual {v1, v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setValue(Ljava/lang/Double;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 804
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getField()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setField(Ljava/lang/String;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 806
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 787
    :cond_2
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;-><init>()V

    .line 789
    sget-object v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;->COUNT:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 790
    invoke-virtual {p0}, Lcom/google/firebase/firestore/AggregateQuerySnapshot;->getCount()J

    move-result-wide v1

    long-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->setValue(Ljava/lang/Double;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;

    .line 792
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 823
    :cond_3
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 825
    invoke-static {p3, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$clearPersistence$3(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 382
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 383
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->clearPersistence()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 384
    invoke-interface {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 386
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$disableNetwork$4(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 398
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 399
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->disableNetwork()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 400
    invoke-interface {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 402
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$documentReferenceDelete$15(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 687
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p0

    .line 689
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentReference;->delete()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Void;

    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 691
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$documentReferenceGet$14(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2

    .line 660
    :try_start_0
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getSource()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;

    move-result-object v0

    invoke-static {v0}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonSource(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;)Lcom/google/firebase/firestore/Source;

    move-result-object v0

    .line 662
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p1

    .line 664
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/DocumentReference;->get(Lcom/google/firebase/firestore/Source;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/DocumentSnapshot;

    .line 671
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getServerTimestampBehavior()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    move-result-object p0

    .line 670
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonServerTimestampBehavior(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    move-result-object p0

    .line 668
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object p0

    .line 667
    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 673
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$documentReferenceSet$12(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2

    .line 577
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p0

    .line 579
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getData()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljava/util/Map;

    .line 584
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getOption()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMerge()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getOption()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMerge()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 585
    invoke-static {}, Lcom/google/firebase/firestore/SetOptions;->merge()Lcom/google/firebase/firestore/SetOptions;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/firebase/firestore/DocumentReference;->set(Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    goto :goto_0

    .line 586
    :cond_0
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getOption()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object v1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMergeFields()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 588
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getOption()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object p1

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMergeFields()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Ljava/util/List;

    .line 589
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseFieldPath(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 590
    invoke-static {p1}, Lcom/google/firebase/firestore/SetOptions;->mergeFieldPaths(Ljava/util/List;)Lcom/google/firebase/firestore/SetOptions;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/firebase/firestore/DocumentReference;->set(Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    goto :goto_0

    .line 592
    :cond_1
    invoke-virtual {p0, v0}, Lcom/google/firebase/firestore/DocumentReference;->set(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    .line 595
    :goto_0
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Void;

    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 597
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method static synthetic lambda$documentReferenceUpdate$13(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 6

    .line 611
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p0

    .line 612
    invoke-virtual {p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getData()Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Ljava/util/Map;

    .line 614
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 615
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 616
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 617
    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/google/firebase/firestore/FieldPath;->of([Ljava/lang/String;)Lcom/google/firebase/firestore/FieldPath;

    move-result-object v3

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 618
    :cond_0
    instance-of v3, v2, Lcom/google/firebase/firestore/FieldPath;

    if-eqz v3, :cond_1

    .line 619
    move-object v3, v2

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 621
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid key type in update data. Supported types are String and FieldPath."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 628
    :cond_2
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/FieldPath;

    .line 629
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 631
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 632
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/firebase/firestore/FieldPath;

    .line 633
    invoke-virtual {v4, p1}, Lcom/google/firebase/firestore/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_1

    .line 636
    :cond_3
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 637
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 641
    :cond_4
    invoke-virtual {v2}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/firebase/firestore/DocumentReference;->update(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    .line 640
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Void;

    .line 639
    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    .line 643
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_2
    return-void
.end method

.method static synthetic lambda$enableNetwork$5(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 414
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 415
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->enableNetwork()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 416
    invoke-interface {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 418
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$getPluginConstantsForFirebaseApp$0(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 1

    const/4 v0, 0x0

    .line 184
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 186
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$namedQueryGet$2(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;)V
    .locals 0

    .line 351
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 352
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->getNamedQuery(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/Query;

    if-nez p0, :cond_0

    .line 355
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "Named query has not been found. Please check it has been loaded properly via loadBundle()."

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 362
    :cond_0
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->getSource()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonSource(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;)Lcom/google/firebase/firestore/Source;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/Query;->get(Lcom/google/firebase/firestore/Source;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/QuerySnapshot;

    .line 368
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->getServerTimestampBehavior()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    move-result-object p1

    .line 367
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonServerTimestampBehavior(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    move-result-object p1

    .line 365
    invoke-static {p0, p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonQuerySnapshot(Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;

    move-result-object p0

    .line 364
    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 370
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$queryGet$16(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 1

    .line 710
    :try_start_0
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->getSource()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;

    move-result-object v0

    invoke-static {v0}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonSource(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;)Lcom/google/firebase/firestore/Source;

    move-result-object v0

    .line 713
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    .line 712
    invoke-static {p1, p2, p3, p4}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseQuery(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;ZLio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;)Lcom/google/firebase/firestore/Query;

    move-result-object p1

    if-nez p1, :cond_0

    .line 716
    new-instance p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;

    const-string p1, "invalid_query"

    const-string p2, "An error occurred while parsing query arguments, see native logs for more information. Please report this issue."

    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p5, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 723
    :cond_0
    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/Query;->get(Lcom/google/firebase/firestore/Source;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/QuerySnapshot;

    .line 729
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->getServerTimestampBehavior()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    move-result-object p0

    .line 728
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonServerTimestampBehavior(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    move-result-object p0

    .line 726
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonQuerySnapshot(Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;

    move-result-object p0

    .line 725
    invoke-interface {p5, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 731
    invoke-static {p5, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$setIndexConfiguration$8(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 464
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 465
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->setIndexConfiguration(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 467
    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 469
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$setLoggingEnabled$9(Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 481
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-static {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->setLoggingEnabled(Z)V

    const/4 p0, 0x0

    .line 483
    invoke-interface {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 485
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$terminate$6(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 1

    .line 430
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 431
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->terminate()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    .line 432
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->destroyCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;)V

    const/4 p0, 0x0

    .line 433
    invoke-interface {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 435
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$waitForPendingWrites$7(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    .line 447
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 448
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->waitForPendingWrites()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 449
    invoke-interface {p1, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 451
    invoke-static {p1, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$writeBatchCommit$18(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 6

    .line 838
    :try_start_0
    invoke-static {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p0

    .line 839
    invoke-virtual {p0}, Lcom/google/firebase/firestore/FirebaseFirestore;->batch()Lcom/google/firebase/firestore/WriteBatch;

    move-result-object v0

    .line 841
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;

    .line 843
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getType()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionType;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionType;

    .line 844
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    .line 845
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getData()Ljava/util/Map;

    move-result-object v4

    .line 847
    invoke-virtual {p0, v3}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v3

    .line 849
    sget-object v5, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$PigeonTransactionType:[I

    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionType;->ordinal()I

    move-result v2

    aget v2, v5, v2

    const/4 v5, 0x1

    if-eq v2, v5, :cond_4

    const/4 v5, 0x2

    if-eq v2, v5, :cond_3

    const/4 v5, 0x3

    if-eq v2, v5, :cond_0

    goto :goto_0

    .line 858
    :cond_0
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getOption()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    .line 860
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMerge()Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMerge()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 863
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/firebase/firestore/SetOptions;->merge()Lcom/google/firebase/firestore/SetOptions;

    move-result-object v1

    .line 862
    invoke-virtual {v0, v3, v4, v1}, Lcom/google/firebase/firestore/WriteBatch;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/firebase/firestore/WriteBatch;

    move-result-object v0

    goto :goto_0

    .line 864
    :cond_1
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMergeFields()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 867
    invoke-virtual {v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMergeFields()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v1

    check-cast v2, Ljava/util/List;

    .line 866
    invoke-static {v1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseFieldPath(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 871
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 872
    invoke-static {v1}, Lcom/google/firebase/firestore/SetOptions;->mergeFieldPaths(Ljava/util/List;)Lcom/google/firebase/firestore/SetOptions;

    move-result-object v1

    .line 869
    invoke-virtual {v0, v3, v4, v1}, Lcom/google/firebase/firestore/WriteBatch;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/firebase/firestore/WriteBatch;

    move-result-object v0

    goto :goto_0

    .line 874
    :cond_2
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Lcom/google/firebase/firestore/WriteBatch;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;)Lcom/google/firebase/firestore/WriteBatch;

    move-result-object v0

    goto/16 :goto_0

    .line 854
    :cond_3
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v4

    check-cast v1, Ljava/util/Map;

    invoke-virtual {v0, v3, v4}, Lcom/google/firebase/firestore/WriteBatch;->update(Lcom/google/firebase/firestore/DocumentReference;Ljava/util/Map;)Lcom/google/firebase/firestore/WriteBatch;

    move-result-object v0

    goto/16 :goto_0

    .line 851
    :cond_4
    invoke-virtual {v0, v3}, Lcom/google/firebase/firestore/WriteBatch;->delete(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/WriteBatch;

    move-result-object v0

    goto/16 :goto_0

    .line 880
    :cond_5
    invoke-virtual {v0}, Lcom/google/firebase/firestore/WriteBatch;->commit()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    const/4 p0, 0x0

    .line 881
    invoke-interface {p2, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 883
    invoke-static {p2, p0}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method private registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;
    .locals 2

    .line 235
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 236
    invoke-direct {p0, p1, v0, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->registerEventChannel(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private registerEventChannel(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;
    .locals 3

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 254
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->MESSAGE_CODEC:Lio/flutter/plugin/common/StandardMethodCodec;

    invoke-direct {v0, v1, p1, v2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;)V

    .line 255
    invoke-virtual {v0, p3}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 256
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method private removeEventListeners()V
    .locals 5

    .line 263
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->eventChannels:Ljava/util/Map;

    monitor-enter v0

    .line 264
    :try_start_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 265
    iget-object v4, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugin/common/EventChannel;

    invoke-virtual {v2, v3}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    goto :goto_0

    .line 267
    :cond_0
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->eventChannels:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 268
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 270
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->streamHandlers:Ljava/util/Map;

    monitor-enter v1

    .line 271
    :try_start_1
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 272
    iget-object v4, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-interface {v2, v3}, Lio/flutter/plugin/common/EventChannel$StreamHandler;->onCancel(Ljava/lang/Object;)V

    goto :goto_1

    .line 274
    :cond_1
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->streamHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 275
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 277
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactionHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void

    :catchall_0
    move-exception v0

    .line 275
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    .line 268
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v1
.end method

.method protected static setCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)V
    .locals 2

    .line 98
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    monitor-enter v0

    .line 99
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    if-nez v1, :cond_0

    .line 101
    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;

    invoke-direct {v1, p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreExtension;-><init>(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public aggregateQuery(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;Ljava/util/List;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;",
            ">;>;)V"
        }
    .end annotation

    .line 749
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p6

    invoke-static {p1, p2, p6, p3}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseQuery(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;ZLio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;)Lcom/google/firebase/firestore/Query;

    move-result-object p1

    .line 752
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 754
    invoke-interface {p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p6

    const/4 v0, 0x1

    if-eqz p6, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;

    .line 755
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$AggregateType:[I

    invoke-virtual {p6}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getType()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;

    move-result-object v2

    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    if-eq v1, v0, :cond_2

    const/4 v0, 0x2

    if-eq v1, v0, :cond_1

    const/4 v0, 0x3

    if-eq v1, v0, :cond_0

    goto :goto_0

    .line 765
    :cond_0
    invoke-virtual {p6}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getField()Ljava/lang/String;

    move-result-object p6

    invoke-static {p6}, Lcom/google/firebase/firestore/AggregateField;->average(Ljava/lang/String;)Lcom/google/firebase/firestore/AggregateField$AverageAggregateField;

    move-result-object p6

    invoke-virtual {p2, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 761
    :cond_1
    invoke-virtual {p6}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;->getField()Ljava/lang/String;

    move-result-object p6

    invoke-static {p6}, Lcom/google/firebase/firestore/AggregateField;->sum(Ljava/lang/String;)Lcom/google/firebase/firestore/AggregateField$SumAggregateField;

    move-result-object p6

    invoke-virtual {p2, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 757
    :cond_2
    invoke-static {}, Lcom/google/firebase/firestore/AggregateField;->count()Lcom/google/firebase/firestore/AggregateField$CountAggregateField;

    move-result-object p6

    invoke-virtual {p2, p6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const/4 p3, 0x0

    .line 773
    invoke-virtual {p2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Lcom/google/firebase/firestore/AggregateField;

    .line 774
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p2

    new-array p3, p3, [Lcom/google/firebase/firestore/AggregateField;

    invoke-interface {p2, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lcom/google/firebase/firestore/AggregateField;

    .line 772
    invoke-virtual {p1, p6, p2}, Lcom/google/firebase/firestore/Query;->aggregate(Lcom/google/firebase/firestore/AggregateField;[Lcom/google/firebase/firestore/AggregateField;)Lcom/google/firebase/firestore/AggregateQuery;

    move-result-object p1

    .line 776
    sget-object p2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance p3, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;

    invoke-direct {p3, p1, p4, p5, p7}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;-><init>(Lcom/google/firebase/firestore/AggregateQuery;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {p2, p3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public clearPersistence(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 379
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda18;

    invoke-direct {v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda18;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
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

    .line 195
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 197
    sget-object v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda12;

    invoke-direct {v2, p0, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda12;-><init>(Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 217
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public disableNetwork(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 395
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public documentReferenceDelete(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 683
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda15;

    invoke-direct {v1, p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda15;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public documentReferenceGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;",
            ">;)V"
        }
    .end annotation

    .line 656
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda14;

    invoke-direct {v1, p2, p1, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda14;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public documentReferenceSet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 573
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda16;

    invoke-direct {v1, p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda16;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public documentReferenceSnapshot(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 925
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v0

    .line 927
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p1

    .line 929
    new-instance v1, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;

    .line 937
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;->getServerTimestampBehavior()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    move-result-object p2

    .line 936
    invoke-static {p2}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonServerTimestampBehavior(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    move-result-object p2

    invoke-direct {v1, v0, p1, p3, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;-><init>(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Boolean;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)V

    const-string p1, "plugins.flutter.io/firebase_firestore/document"

    .line 930
    invoke-direct {p0, p1, v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 929
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public documentReferenceUpdate(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 607
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda17;

    invoke-direct {v1, p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda17;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public enableNetwork(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 411
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
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

    .line 179
    new-instance p1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 181
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda10;

    invoke-direct {v1, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda10;-><init>(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 190
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$didReinitializeFirebaseCore$1$io-flutter-plugins-firebase-firestore-FlutterFirebaseFirestorePlugin(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 3

    .line 202
    :try_start_0
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->firestoreInstanceCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 203
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 204
    invoke-virtual {v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->terminate()Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    .line 205
    invoke-static {v1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->destroyCachedFirebaseFirestoreInstanceForKey(Lcom/google/firebase/firestore/FirebaseFirestore;)V

    goto :goto_0

    .line 208
    :cond_0
    invoke-direct {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->removeEventListeners()V

    const/4 v0, 0x0

    .line 210
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 213
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_1
    return-void
.end method

.method public synthetic lambda$transactionCreate$10$io-flutter-plugins-firebase-firestore-FlutterFirebaseFirestorePlugin(Ljava/lang/String;Lcom/google/firebase/firestore/Transaction;)V
    .locals 1

    .line 512
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactions:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public synthetic lambda$transactionGet$11$io-flutter-plugins-firebase-firestore-FlutterFirebaseFirestorePlugin(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 1

    .line 546
    :try_start_0
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p1

    .line 548
    iget-object p2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactions:Ljava/util/Map;

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/firebase/firestore/Transaction;

    if-nez p2, :cond_0

    .line 551
    new-instance p1, Ljava/lang/Exception;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Transaction.getDocument(): No transaction handler exists for ID: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 560
    :cond_0
    invoke-virtual {p2, p1}, Lcom/google/firebase/firestore/Transaction;->get(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/DocumentSnapshot;

    move-result-object p1

    sget-object p2, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 559
    invoke-static {p1, p2}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object p1

    .line 558
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 563
    invoke-static {p4, p1}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->sendErrorToFlutter(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method

.method public loadBundle(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;[BLio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "[B",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 332
    new-instance v0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;

    .line 335
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;-><init>(Lcom/google/firebase/firestore/FirebaseFirestore;[B)V

    const-string p1, "plugins.flutter.io/firebase_firestore/loadBundle"

    .line 333
    invoke-direct {p0, p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 332
    invoke-interface {p3, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public namedQueryGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;",
            ">;)V"
        }
    .end annotation

    .line 348
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda6;

    invoke-direct {v1, p1, p2, p4, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    .line 142
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->attachToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 130
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->initInstance(Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 0

    .line 158
    invoke-direct {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->detachToActivity()V

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 0

    .line 147
    invoke-direct {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->detachToActivity()V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 135
    invoke-direct {p0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->removeEventListeners()V

    const/4 p1, 0x0

    .line 137
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    .line 153
    invoke-direct {p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->attachToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V

    return-void
.end method

.method public queryGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;",
            ">;)V"
        }
    .end annotation

    .line 707
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda8;

    move-object v1, v8

    move-object v2, p5

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public querySnapshot(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 898
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    invoke-static {p1, p2, p3, p4}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseQuery(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;ZLio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;)Lcom/google/firebase/firestore/Query;

    move-result-object p1

    if-nez p1, :cond_0

    .line 901
    new-instance p1, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;

    const/4 p2, 0x0

    const-string p3, "invalid_query"

    const-string p4, "An error occurred while parsing query arguments, see native logs for more information. Please report this issue."

    invoke-direct {p1, p3, p4, p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p7, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->error(Ljava/lang/Throwable;)V

    return-void

    .line 909
    :cond_0
    new-instance p2, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;

    .line 916
    invoke-virtual {p5}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;->getServerTimestampBehavior()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;

    move-result-object p3

    .line 915
    invoke-static {p3}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parsePigeonServerTimestampBehavior(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    move-result-object p3

    invoke-direct {p2, p1, p6, p3}, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;-><init>(Lcom/google/firebase/firestore/Query;Ljava/lang/Boolean;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)V

    const-string p1, "plugins.flutter.io/firebase_firestore/query"

    .line 910
    invoke-direct {p0, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 909
    invoke-interface {p7, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public setIndexConfiguration(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 461
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setLoggingEnabled(Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 478
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;

    invoke-direct {v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda9;-><init>(Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public snapshotsInSyncSetup(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 494
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object p1

    .line 496
    new-instance v0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;

    invoke-direct {v0, p1}, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;-><init>(Lcom/google/firebase/firestore/FirebaseFirestore;)V

    const-string p1, "plugins.flutter.io/firebase_firestore/snapshotsInSync"

    .line 497
    invoke-direct {p0, p1, v0}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->registerEventChannel(Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    move-result-object p1

    .line 496
    invoke-interface {p2, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public terminate(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 427
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public transactionCreate(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 507
    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->getFirestoreFromPigeon(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;)Lcom/google/firebase/firestore/FirebaseFirestore;

    move-result-object v2

    .line 509
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 510
    new-instance v6, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;Ljava/lang/String;)V

    move-object v0, v6

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;-><init>(Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V

    const-string p2, "plugins.flutter.io/firebase_firestore/transaction"

    .line 518
    invoke-direct {p0, p2, p1, v6}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->registerEventChannel(Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugin/common/EventChannel$StreamHandler;)Ljava/lang/String;

    .line 519
    iget-object p2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactionHandlers:Ljava/util/Map;

    invoke-interface {p2, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public transactionGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;",
            ">;)V"
        }
    .end annotation

    .line 543
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v7, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda13;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda13;-><init>(Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v7}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public transactionStoreResult(Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;",
            ">;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 529
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->transactionHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/firebase/firestore/streamhandler/OnTransactionResultListener;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Lio/flutter/plugins/firebase/firestore/streamhandler/OnTransactionResultListener;

    .line 530
    invoke-interface {p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/streamhandler/OnTransactionResultListener;->receiveTransactionResponse(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;Ljava/util/List;)V

    const/4 p1, 0x0

    .line 531
    invoke-interface {p4, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public waitForPendingWrites(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 444
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1, p2}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public writeBatchCommit(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;",
            ">;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 835
    sget-object v0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->cachedThreadPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda7;

    invoke-direct {v1, p1, p2, p3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda7;-><init>(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
