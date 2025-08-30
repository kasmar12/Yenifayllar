.class public Lcom/google/firebase/firestore/core/MemoryComponentProvider;
.super Lcom/google/firebase/firestore/core/ComponentProvider;
.source "MemoryComponentProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/core/MemoryComponentProvider$RemoteStoreCallback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/google/firebase/firestore/core/ComponentProvider;-><init>()V

    return-void
.end method

.method private isMemoryLruGcEnabled(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z
    .locals 1

    .line 72
    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->getCacheSettings()Lcom/google/firebase/firestore/LocalCacheSettings;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->getCacheSettings()Lcom/google/firebase/firestore/LocalCacheSettings;

    move-result-object v0

    instance-of v0, v0, Lcom/google/firebase/firestore/MemoryCacheSettings;

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->getCacheSettings()Lcom/google/firebase/firestore/LocalCacheSettings;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/firestore/MemoryCacheSettings;

    .line 75
    invoke-virtual {p1}, Lcom/google/firebase/firestore/MemoryCacheSettings;->getGarbageCollectorSettings()Lcom/google/firebase/firestore/MemoryGarbageCollectorSettings;

    move-result-object p1

    instance-of p1, p1, Lcom/google/firebase/firestore/MemoryLruGcSettings;

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method protected createConnectivityMonitor(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;
    .locals 1

    .line 68
    new-instance v0, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected bridge synthetic createConnectivityMonitor(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/remote/ConnectivityMonitor;
    .locals 0

    .line 42
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->createConnectivityMonitor(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/remote/AndroidConnectivityMonitor;

    move-result-object p1

    return-object p1
.end method

.method protected createEventManager(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/core/EventManager;
    .locals 1

    .line 58
    new-instance p1, Lcom/google/firebase/firestore/core/EventManager;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->getSyncEngine()Lcom/google/firebase/firestore/core/SyncEngine;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/google/firebase/firestore/core/EventManager;-><init>(Lcom/google/firebase/firestore/core/SyncEngine;)V

    return-object p1
.end method

.method protected createGarbageCollectionScheduler(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/local/Scheduler;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected createIndexBackfiller(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/local/IndexBackfiller;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected createLocalStore(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/local/LocalStore;
    .locals 3

    .line 63
    new-instance v0, Lcom/google/firebase/firestore/local/LocalStore;

    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->getPersistence()Lcom/google/firebase/firestore/local/Persistence;

    move-result-object v1

    new-instance v2, Lcom/google/firebase/firestore/local/QueryEngine;

    invoke-direct {v2}, Lcom/google/firebase/firestore/local/QueryEngine;-><init>()V

    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getInitialUser()Lcom/google/firebase/firestore/auth/User;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/google/firebase/firestore/local/LocalStore;-><init>(Lcom/google/firebase/firestore/local/Persistence;Lcom/google/firebase/firestore/local/QueryEngine;Lcom/google/firebase/firestore/auth/User;)V

    return-object v0
.end method

.method protected createPersistence(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/local/Persistence;
    .locals 3

    .line 83
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getSettings()Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->isMemoryLruGcEnabled(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 84
    new-instance v0, Lcom/google/firebase/firestore/local/LocalSerializer;

    new-instance v1, Lcom/google/firebase/firestore/remote/RemoteSerializer;

    .line 86
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getDatabaseInfo()Lcom/google/firebase/firestore/core/DatabaseInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/firestore/core/DatabaseInfo;->getDatabaseId()Lcom/google/firebase/firestore/model/DatabaseId;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/firebase/firestore/remote/RemoteSerializer;-><init>(Lcom/google/firebase/firestore/model/DatabaseId;)V

    invoke-direct {v0, v1}, Lcom/google/firebase/firestore/local/LocalSerializer;-><init>(Lcom/google/firebase/firestore/remote/RemoteSerializer;)V

    .line 89
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getSettings()Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->getCacheSizeBytes()J

    move-result-wide v1

    .line 88
    invoke-static {v1, v2}, Lcom/google/firebase/firestore/local/LruGarbageCollector$Params;->WithCacheSizeBytes(J)Lcom/google/firebase/firestore/local/LruGarbageCollector$Params;

    move-result-object p1

    .line 90
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/local/MemoryPersistence;->createLruGcMemoryPersistence(Lcom/google/firebase/firestore/local/LruGarbageCollector$Params;Lcom/google/firebase/firestore/local/LocalSerializer;)Lcom/google/firebase/firestore/local/MemoryPersistence;

    move-result-object p1

    return-object p1

    .line 93
    :cond_0
    invoke-static {}, Lcom/google/firebase/firestore/local/MemoryPersistence;->createEagerGcMemoryPersistence()Lcom/google/firebase/firestore/local/MemoryPersistence;

    move-result-object p1

    return-object p1
.end method

.method protected createRemoteStore(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/remote/RemoteStore;
    .locals 7

    .line 98
    new-instance v6, Lcom/google/firebase/firestore/remote/RemoteStore;

    new-instance v1, Lcom/google/firebase/firestore/core/MemoryComponentProvider$RemoteStoreCallback;

    const/4 v0, 0x0

    invoke-direct {v1, p0, v0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider$RemoteStoreCallback;-><init>(Lcom/google/firebase/firestore/core/MemoryComponentProvider;Lcom/google/firebase/firestore/core/MemoryComponentProvider$1;)V

    .line 100
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->getLocalStore()Lcom/google/firebase/firestore/local/LocalStore;

    move-result-object v2

    .line 101
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getDatastore()Lcom/google/firebase/firestore/remote/Datastore;

    move-result-object v3

    .line 102
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getAsyncQueue()Lcom/google/firebase/firestore/util/AsyncQueue;

    move-result-object v4

    .line 103
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->getConnectivityMonitor()Lcom/google/firebase/firestore/remote/ConnectivityMonitor;

    move-result-object v5

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/google/firebase/firestore/remote/RemoteStore;-><init>(Lcom/google/firebase/firestore/remote/RemoteStore$RemoteStoreCallback;Lcom/google/firebase/firestore/local/LocalStore;Lcom/google/firebase/firestore/remote/Datastore;Lcom/google/firebase/firestore/util/AsyncQueue;Lcom/google/firebase/firestore/remote/ConnectivityMonitor;)V

    return-object v6
.end method

.method protected createSyncEngine(Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;)Lcom/google/firebase/firestore/core/SyncEngine;
    .locals 4

    .line 108
    new-instance v0, Lcom/google/firebase/firestore/core/SyncEngine;

    .line 109
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->getLocalStore()Lcom/google/firebase/firestore/local/LocalStore;

    move-result-object v1

    .line 110
    invoke-virtual {p0}, Lcom/google/firebase/firestore/core/MemoryComponentProvider;->getRemoteStore()Lcom/google/firebase/firestore/remote/RemoteStore;

    move-result-object v2

    .line 111
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getInitialUser()Lcom/google/firebase/firestore/auth/User;

    move-result-object v3

    .line 112
    invoke-virtual {p1}, Lcom/google/firebase/firestore/core/ComponentProvider$Configuration;->getMaxConcurrentLimboResolutions()I

    move-result p1

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/google/firebase/firestore/core/SyncEngine;-><init>(Lcom/google/firebase/firestore/local/LocalStore;Lcom/google/firebase/firestore/remote/RemoteStore;Lcom/google/firebase/firestore/auth/User;I)V

    return-object v0
.end method
