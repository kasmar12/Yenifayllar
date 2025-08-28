.class public Lcom/tekartik/sqflite/SqflitePlugin;
.super Ljava/lang/Object;
.source "SqflitePlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field private static THREAD_COUNT:I

.field private static THREAD_PRIORITY:I

.field static final _singleInstancesByPath:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static databaseId:I

.field static final databaseMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/tekartik/sqflite/Database;",
            ">;"
        }
    .end annotation
.end field

.field private static final databaseMapLocker:Ljava/lang/Object;

.field private static databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

.field static databasesPath:Ljava/lang/String;

.field static logLevel:I

.field private static final openCloseLocker:Ljava/lang/Object;


# instance fields
.field private context:Landroid/content/Context;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    .line 62
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->openCloseLocker:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 64
    sput v0, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    .line 67
    sput v0, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_PRIORITY:I

    const/4 v1, 0x1

    .line 68
    sput v1, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_COUNT:I

    .line 69
    sput v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseId:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/tekartik/sqflite/SqflitePlugin;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
    .locals 1

    .line 57
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->openCloseLocker:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/tekartik/sqflite/SqflitePlugin;Lcom/tekartik/sqflite/Database;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Lcom/tekartik/sqflite/SqflitePlugin;->closeDatabase(Lcom/tekartik/sqflite/Database;)V

    return-void
.end method

.method static synthetic access$200()I
    .locals 1

    .line 57
    sget v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseId:I

    return v0
.end method

.method private closeDatabase(Lcom/tekartik/sqflite/Database;)V
    .locals 4

    .line 566
    :try_start_0
    iget v0, p1, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {v0}, Lcom/tekartik/sqflite/LogLevel;->hasSqlLevel(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Sqflite"

    .line 567
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "closing database "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    :cond_0
    invoke-virtual {p1}, Lcom/tekartik/sqflite/Database;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Sqflite"

    .line 571
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " while closing database "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseId:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 573
    :goto_0
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    monitor-enter v0

    .line 575
    :try_start_1
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    if-eqz v1, :cond_2

    .line 576
    iget v1, p1, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {v1}, Lcom/tekartik/sqflite/LogLevel;->hasSqlLevel(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "Sqflite"

    .line 577
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "stopping thread"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    :cond_1
    sget-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    invoke-interface {p1}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->quit()V

    const/4 p1, 0x0

    .line 580
    sput-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    .line 582
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private static fixMap(Ljava/util/Map;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 95
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 96
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 97
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    .line 98
    instance-of v3, v2, Ljava/util/Map;

    if-eqz v3, :cond_0

    .line 100
    check-cast v2, Ljava/util/Map;

    .line 101
    invoke-static {v2}, Lcom/tekartik/sqflite/SqflitePlugin;->fixMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    goto :goto_1

    .line 103
    :cond_0
    invoke-static {v2}, Lcom/tekartik/sqflite/SqflitePlugin;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 105
    :goto_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/tekartik/sqflite/SqflitePlugin;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getContext()Landroid/content/Context;
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/tekartik/sqflite/SqflitePlugin;->context:Landroid/content/Context;

    return-object v0
.end method

.method private getDatabase(I)Lcom/tekartik/sqflite/Database;
    .locals 1

    .line 175
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tekartik/sqflite/Database;

    return-object p1
.end method

.method private getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;
    .locals 2

    const-string v0, "id"

    .line 179
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 180
    invoke-direct {p0, p1}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabase(I)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 185
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "database_closed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "sqlite_error"

    const/4 v1, 0x0

    invoke-interface {p2, v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method

.method static isInMemoryPath(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_1

    const-string v0, ":memory:"

    .line 131
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method static synthetic lambda$onBatchCall$2(Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 227
    invoke-virtual {p0, p1, p2}, Lcom/tekartik/sqflite/Database;->batch(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    return-void
.end method

.method static synthetic lambda$onExecuteCall$4(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V
    .locals 1

    .line 255
    new-instance v0, Lcom/tekartik/sqflite/operation/MethodCallOperation;

    invoke-direct {v0, p0, p1}, Lcom/tekartik/sqflite/operation/MethodCallOperation;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 256
    invoke-virtual {p2, v0}, Lcom/tekartik/sqflite/Database;->execute(Lcom/tekartik/sqflite/operation/Operation;)V

    return-void
.end method

.method static synthetic lambda$onInsertCall$3(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V
    .locals 1

    .line 240
    new-instance v0, Lcom/tekartik/sqflite/operation/MethodCallOperation;

    invoke-direct {v0, p0, p1}, Lcom/tekartik/sqflite/operation/MethodCallOperation;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 241
    invoke-virtual {p2, v0}, Lcom/tekartik/sqflite/Database;->insert(Lcom/tekartik/sqflite/operation/Operation;)V

    return-void
.end method

.method static synthetic lambda$onOpenDatabaseCall$7(ZLjava/lang/String;Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/Boolean;Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodCall;ZI)V
    .locals 2

    .line 414
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->openCloseLocker:Ljava/lang/Object;

    monitor-enter v0

    if-nez p0, :cond_0

    .line 417
    :try_start_0
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 418
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 419
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_0

    .line 420
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-nez p0, :cond_0

    .line 421
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "sqlite_error"

    .line 422
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "open_failed "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x0

    invoke-interface {p2, p0, p1, p3}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 423
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    return-void

    .line 431
    :cond_0
    :try_start_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, p3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 432
    invoke-virtual {p4}, Lcom/tekartik/sqflite/Database;->openReadOnly()V

    goto :goto_0

    .line 434
    :cond_1
    invoke-virtual {p4}, Lcom/tekartik/sqflite/Database;->open()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 442
    :goto_0
    :try_start_2
    sget-object p0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    monitor-enter p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p6, :cond_2

    .line 444
    :try_start_3
    sget-object p3, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-interface {p3, p1, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    :cond_2
    sget-object p3, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-interface {p3, p5, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 448
    :try_start_4
    iget p0, p4, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {p0}, Lcom/tekartik/sqflite/LogLevel;->hasSqlLevel(I)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "Sqflite"

    .line 449
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "opened "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, " "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    :cond_3
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    const/4 p0, 0x0

    .line 453
    invoke-static {p7, p0, p0}, Lcom/tekartik/sqflite/SqflitePlugin;->makeOpenResult(IZZ)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p2, p0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    .line 447
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw p1

    :catchall_1
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 437
    new-instance p1, Lcom/tekartik/sqflite/operation/MethodCallOperation;

    invoke-direct {p1, p5, p2}, Lcom/tekartik/sqflite/operation/MethodCallOperation;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 438
    invoke-virtual {p4, p0, p1}, Lcom/tekartik/sqflite/Database;->handleException(Ljava/lang/Exception;Lcom/tekartik/sqflite/operation/Operation;)V

    .line 439
    monitor-exit v0

    return-void

    .line 451
    :goto_1
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw p0
.end method

.method static synthetic lambda$onQueryCall$0(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V
    .locals 1

    .line 199
    new-instance v0, Lcom/tekartik/sqflite/operation/MethodCallOperation;

    invoke-direct {v0, p0, p1}, Lcom/tekartik/sqflite/operation/MethodCallOperation;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 200
    invoke-virtual {p2, v0}, Lcom/tekartik/sqflite/Database;->query(Lcom/tekartik/sqflite/operation/Operation;)V

    return-void
.end method

.method static synthetic lambda$onQueryCursorNextCall$1(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V
    .locals 1

    .line 213
    new-instance v0, Lcom/tekartik/sqflite/operation/MethodCallOperation;

    invoke-direct {v0, p0, p1}, Lcom/tekartik/sqflite/operation/MethodCallOperation;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 214
    invoke-virtual {p2, v0}, Lcom/tekartik/sqflite/Database;->queryCursorNext(Lcom/tekartik/sqflite/operation/Operation;)V

    return-void
.end method

.method static synthetic lambda$onSetLocaleCall$5(Lio/flutter/plugin/common/MethodCall;Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    const-string v0, "locale"

    .line 267
    invoke-virtual {p0, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const/4 v0, 0x0

    .line 269
    :try_start_0
    iget-object p1, p1, Lcom/tekartik/sqflite/Database;->sqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {p0}, Lcom/tekartik/sqflite/Utils;->localeForLanguateTag(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->setLocale(Ljava/util/Locale;)V

    .line 270
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 272
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error calling setLocale: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "sqlite_error"

    invoke-interface {p2, p1, p0, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method static synthetic lambda$onUpdateCall$6(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V
    .locals 1

    .line 288
    new-instance v0, Lcom/tekartik/sqflite/operation/MethodCallOperation;

    invoke-direct {v0, p0, p1}, Lcom/tekartik/sqflite/operation/MethodCallOperation;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 289
    invoke-virtual {p2, v0}, Lcom/tekartik/sqflite/Database;->update(Lcom/tekartik/sqflite/operation/Operation;)V

    return-void
.end method

.method static makeOpenResult(IZZ)Ljava/util/Map;
    .locals 2

    .line 139
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 140
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const-string v1, "id"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    .line 142
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    if-eqz p1, :cond_0

    const-string p1, "recovered"

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p2, :cond_1

    const-string p1, "recoveredInTransaction"

    .line 145
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method

.method private onAttachedToEngine(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 3

    .line 156
    iput-object p1, p0, Lcom/tekartik/sqflite/SqflitePlugin;->context:Landroid/content/Context;

    .line 157
    new-instance p1, Lio/flutter/plugin/common/MethodChannel;

    sget-object v0, Lio/flutter/plugin/common/StandardMethodCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;

    .line 159
    invoke-interface {p2}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    const-string v2, "com.tekartik.sqflite"

    invoke-direct {p1, p2, v2, v0, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MethodCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    iput-object p1, p0, Lcom/tekartik/sqflite/SqflitePlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 160
    invoke-virtual {p1, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method private onBatchCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 223
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 227
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda0;-><init>(Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method private onCloseDatabaseCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 4

    const-string v0, "id"

    .line 463
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 464
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 469
    :cond_0
    iget v1, p1, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {v1}, Lcom/tekartik/sqflite/LogLevel;->hasSqlLevel(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "Sqflite"

    .line 470
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "closing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p1, Lcom/tekartik/sqflite/Database;->path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    :cond_1
    iget-object v1, p1, Lcom/tekartik/sqflite/Database;->path:Ljava/lang/String;

    .line 476
    sget-object v2, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    monitor-enter v2

    .line 477
    :try_start_0
    sget-object v3, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    iget-boolean v0, p1, Lcom/tekartik/sqflite/Database;->singleInstance:Z

    if-eqz v0, :cond_2

    .line 480
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    :cond_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 484
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v1, Lcom/tekartik/sqflite/SqflitePlugin$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin$1;-><init>(Lcom/tekartik/sqflite/SqflitePlugin;Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-interface {v0, p1, v1}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    .line 482
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private onDatabaseExistsCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    const-string v0, "path"

    .line 559
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 560
    invoke-static {p1}, Lcom/tekartik/sqflite/Database;->existsDatabase(Ljava/lang/String;)Z

    move-result p1

    .line 561
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private onDebugCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 8

    const-string v0, "cmd"

    .line 294
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 295
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "get"

    .line 299
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 300
    sget p1, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    const-string v1, "logLevel"

    if-lez p1, :cond_0

    .line 301
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    :cond_0
    sget-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 304
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 305
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 306
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/tekartik/sqflite/Database;

    .line 307
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 308
    iget-object v6, v4, Lcom/tekartik/sqflite/Database;->path:Ljava/lang/String;

    const-string v7, "path"

    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    iget-boolean v6, v4, Lcom/tekartik/sqflite/Database;->singleInstance:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "singleInstance"

    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    iget v6, v4, Lcom/tekartik/sqflite/Database;->logLevel:I

    if-lez v6, :cond_1

    .line 311
    iget v4, v4, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v5, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    :cond_1
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const-string p1, "databases"

    .line 316
    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    :cond_3
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private onDebugModeCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 326
    invoke-virtual {p1}, Lio/flutter/plugin/common/MethodCall;->arguments()Ljava/lang/Object;

    move-result-object p1

    .line 327
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    sput-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->LOGV:Z

    .line 328
    sget-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->_EXTRA_LOGV:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    sget-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->LOGV:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    sput-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->EXTRA_LOGV:Z

    .line 331
    sget-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->LOGV:Z

    if-eqz p1, :cond_2

    .line 332
    sget-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->EXTRA_LOGV:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x2

    .line 333
    sput p1, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    goto :goto_1

    .line 334
    :cond_1
    sget-boolean p1, Lcom/tekartik/sqflite/dev/Debug;->LOGV:Z

    if-eqz p1, :cond_3

    .line 335
    sput v0, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    goto :goto_1

    .line 339
    :cond_2
    sput v1, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    :cond_3
    :goto_1
    const/4 p1, 0x0

    .line 341
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private onDeleteDatabaseCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 8

    const-string v0, "path"

    .line 501
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 504
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    monitor-enter v0

    .line 505
    :try_start_0
    sget v1, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    invoke-static {v1}, Lcom/tekartik/sqflite/LogLevel;->hasVerboseLevel(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Sqflite"

    .line 506
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Look for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 510
    sget-object v3, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/tekartik/sqflite/Database;

    if-eqz v4, :cond_3

    .line 512
    iget-object v5, v4, Lcom/tekartik/sqflite/Database;->sqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 513
    sget v5, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    invoke-static {v5}, Lcom/tekartik/sqflite/LogLevel;->hasVerboseLevel(I)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "Sqflite"

    .line 514
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "found single instance "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/tekartik/sqflite/Database;->isInTransaction()Z

    move-result v7

    if-eqz v7, :cond_1

    const-string v7, "(in transaction) "

    goto :goto_0

    :cond_1
    const-string v7, ""

    :goto_0
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    :cond_2
    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    .line 524
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    new-instance v0, Lcom/tekartik/sqflite/SqflitePlugin$2;

    invoke-direct {v0, p0, v4, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin$2;-><init>(Lcom/tekartik/sqflite/SqflitePlugin;Lcom/tekartik/sqflite/Database;Ljava/lang/String;Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 549
    sget-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    if-eqz p1, :cond_4

    .line 550
    invoke-interface {p1, v4, v0}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    goto :goto_2

    .line 553
    :cond_4
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :goto_2
    return-void

    :catchall_0
    move-exception p1

    .line 524
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private onExecuteCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 250
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 254
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1, p2, v0}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method private onInsertCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 235
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 239
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1, p2, v0}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method private onOpenDatabaseCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 16

    move-object/from16 v0, p1

    const-string v1, "path"

    .line 348
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Ljava/lang/String;

    const-string v1, "readOnly"

    .line 349
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Ljava/lang/Boolean;

    .line 350
    invoke-static {v8}, Lcom/tekartik/sqflite/SqflitePlugin;->isInMemoryPath(Ljava/lang/String;)Z

    move-result v10

    .line 352
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v2, "singleInstance"

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_0

    if-nez v10, :cond_0

    const/4 v11, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    const/4 v11, 0x0

    :goto_0
    if-eqz v11, :cond_6

    .line 360
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    monitor-enter v1

    .line 361
    :try_start_0
    sget v3, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    invoke-static {v3}, Lcom/tekartik/sqflite/LogLevel;->hasVerboseLevel(I)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "Sqflite"

    .line 362
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Look for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    :cond_1
    sget-object v3, Lcom/tekartik/sqflite/SqflitePlugin;->_singleInstancesByPath:Ljava/util/Map;

    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v3, :cond_5

    .line 366
    sget-object v4, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/tekartik/sqflite/Database;

    if-eqz v4, :cond_5

    .line 368
    iget-object v5, v4, Lcom/tekartik/sqflite/Database;->sqliteDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v5

    if-nez v5, :cond_2

    .line 369
    sget v3, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    invoke-static {v3}, Lcom/tekartik/sqflite/LogLevel;->hasVerboseLevel(I)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string v3, "Sqflite"

    .line 370
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "single instance database of "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " not opened"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 373
    :cond_2
    sget v0, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    invoke-static {v0}, Lcom/tekartik/sqflite/LogLevel;->hasVerboseLevel(I)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Sqflite"

    .line 374
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "re-opened single instance "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/tekartik/sqflite/Database;->isInTransaction()Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v6, "(in transaction) "

    goto :goto_1

    :cond_3
    const-string v6, ""

    :goto_1
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v4}, Lcom/tekartik/sqflite/Database;->isInTransaction()Z

    move-result v3

    invoke-static {v0, v2, v3}, Lcom/tekartik/sqflite/SqflitePlugin;->makeOpenResult(IZZ)Ljava/util/Map;

    move-result-object v0

    move-object/from16 v12, p2

    invoke-interface {v12, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 377
    monitor-exit v1

    return-void

    :cond_5
    :goto_2
    move-object/from16 v12, p2

    .line 381
    monitor-exit v1

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_6
    move-object/from16 v12, p2

    .line 386
    :goto_3
    sget-object v13, Lcom/tekartik/sqflite/SqflitePlugin;->databaseMapLocker:Ljava/lang/Object;

    monitor-enter v13

    .line 387
    :try_start_1
    sget v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseId:I

    add-int/lit8 v14, v1, 0x1

    sput v14, Lcom/tekartik/sqflite/SqflitePlugin;->databaseId:I

    .line 388
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 391
    new-instance v15, Lcom/tekartik/sqflite/Database;

    move-object/from16 v1, p0

    iget-object v3, v1, Lcom/tekartik/sqflite/SqflitePlugin;->context:Landroid/content/Context;

    sget v7, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    move-object v2, v15

    move-object v4, v8

    move v5, v14

    move v6, v11

    invoke-direct/range {v2 .. v7}, Lcom/tekartik/sqflite/Database;-><init>(Landroid/content/Context;Ljava/lang/String;IZI)V

    .line 393
    monitor-enter v13

    .line 395
    :try_start_2
    sget-object v2, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    if-nez v2, :cond_7

    const-string v2, "Sqflite"

    .line 396
    sget v3, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_COUNT:I

    sget v4, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_PRIORITY:I

    invoke-static {v2, v3, v4}, Lcom/tekartik/sqflite/DatabaseWorkerPool$-CC;->create(Ljava/lang/String;II)Lcom/tekartik/sqflite/DatabaseWorkerPool;

    move-result-object v2

    sput-object v2, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    .line 398
    invoke-interface {v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->start()V

    .line 399
    iget v2, v15, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {v2}, Lcom/tekartik/sqflite/LogLevel;->hasSqlLevel(I)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v2, "Sqflite"

    .line 400
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "starting worker pool with priority "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v4, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_PRIORITY:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    :cond_7
    sget-object v2, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    iput-object v2, v15, Lcom/tekartik/sqflite/Database;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    .line 404
    iget v2, v15, Lcom/tekartik/sqflite/Database;->logLevel:I

    invoke-static {v2}, Lcom/tekartik/sqflite/LogLevel;->hasSqlLevel(I)Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v2, "Sqflite"

    .line 405
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15}, Lcom/tekartik/sqflite/Database;->getThreadLogPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "opened "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 410
    :cond_8
    sget-object v7, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v6, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda7;

    move-object v1, v6

    move v2, v10

    move-object v3, v8

    move-object/from16 v4, p2

    move-object v5, v9

    move-object v10, v6

    move-object v6, v15

    move-object v12, v7

    move-object/from16 v7, p1

    move v8, v11

    move v9, v14

    invoke-direct/range {v1 .. v9}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda7;-><init>(ZLjava/lang/String;Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/Boolean;Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodCall;ZI)V

    invoke-interface {v12, v15, v10}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    .line 455
    monitor-exit v13

    return-void

    :catchall_1
    move-exception v0

    monitor-exit v13
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :catchall_2
    move-exception v0

    .line 388
    :try_start_3
    monitor-exit v13
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0
.end method

.method private onQueryCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 194
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 198
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1, p2, v0}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method private onQueryCursorNextCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 208
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 212
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1, p2, v0}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method private onSetLocaleCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 262
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 266
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda1;

    invoke-direct {v2, p1, v0, p2}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugin/common/MethodCall;Lcom/tekartik/sqflite/Database;Lio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method private onUpdateCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 283
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->getDatabaseOrError(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)Lcom/tekartik/sqflite/Database;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 287
    :cond_0
    sget-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    new-instance v2, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda6;

    invoke-direct {v2, p1, p2, v0}, Lcom/tekartik/sqflite/SqflitePlugin$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;Lcom/tekartik/sqflite/Database;)V

    invoke-interface {v1, v0, v2}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->post(Lcom/tekartik/sqflite/Database;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static registerWith(Lio/flutter/plugin/common/PluginRegistry$Registrar;)V
    .locals 2

    .line 90
    new-instance v0, Lcom/tekartik/sqflite/SqflitePlugin;

    invoke-direct {v0}, Lcom/tekartik/sqflite/SqflitePlugin;-><init>()V

    .line 91
    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->context()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->messenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/tekartik/sqflite/SqflitePlugin;->onAttachedToEngine(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method private static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 4

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 115
    :cond_0
    instance-of v0, p0, [B

    if-eqz v0, :cond_2

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 117
    check-cast p0, [B

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-byte v3, p0, v2

    .line 118
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 121
    :cond_2
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_3

    .line 123
    check-cast p0, Ljava/util/Map;

    .line 124
    invoke-static {p0}, Lcom/tekartik/sqflite/SqflitePlugin;->fixMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 126
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 152
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/tekartik/sqflite/SqflitePlugin;->onAttachedToEngine(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const/4 p1, 0x0

    .line 165
    iput-object p1, p0, Lcom/tekartik/sqflite/SqflitePlugin;->context:Landroid/content/Context;

    .line 166
    iget-object v0, p0, Lcom/tekartik/sqflite/SqflitePlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 167
    iput-object p1, p0, Lcom/tekartik/sqflite/SqflitePlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    return-void
.end method

.method onGetDatabasesPathCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 684
    sget-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databasesPath:Ljava/lang/String;

    if-nez p1, :cond_0

    .line 686
    iget-object p1, p0, Lcom/tekartik/sqflite/SqflitePlugin;->context:Landroid/content/Context;

    const-string v0, "tekartik_sqflite.db"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 687
    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databasesPath:Ljava/lang/String;

    .line 689
    :cond_0
    sget-object p1, Lcom/tekartik/sqflite/SqflitePlugin;->databasesPath:Ljava/lang/String;

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 587
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "getDatabasesPath"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_1
    const-string v1, "getPlatformVersion"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_2
    const-string v1, "queryCursorNext"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_3
    const-string v1, "databaseExists"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_4
    const-string v1, "query"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_5
    const-string v1, "debug"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_6
    const-string v1, "batch"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_7
    const-string v1, "openDatabase"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_8
    const-string v1, "debugMode"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto :goto_0

    :cond_8
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_9
    const-string v1, "deleteDatabase"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_0

    :cond_9
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_a
    const-string v1, "androidSetLocale"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto :goto_0

    :cond_a
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_b
    const-string v1, "update"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_0

    :cond_b
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_c
    const-string v1, "insert"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_0

    :cond_c
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_d
    const-string v1, "options"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_0

    :cond_d
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_e
    const-string v1, "closeDatabase"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto :goto_0

    :cond_e
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_f
    const-string v1, "execute"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_0

    :cond_f
    const/4 v2, 0x0

    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 655
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_1

    .line 626
    :pswitch_0
    invoke-virtual {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onGetDatabasesPathCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 590
    :pswitch_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Android "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 638
    :pswitch_2
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onQueryCursorNextCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 642
    :pswitch_3
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onDatabaseExistsCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 598
    :pswitch_4
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onQueryCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 634
    :pswitch_5
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onDebugCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 618
    :pswitch_6
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onBatchCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 614
    :pswitch_7
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onOpenDatabaseCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 647
    :pswitch_8
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onDebugModeCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 630
    :pswitch_9
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onDeleteDatabaseCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 651
    :pswitch_a
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onSetLocaleCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 606
    :pswitch_b
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onUpdateCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 602
    :pswitch_c
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onInsertCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 622
    :pswitch_d
    invoke-virtual {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onOptionsCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 594
    :pswitch_e
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onCloseDatabaseCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 610
    :pswitch_f
    invoke-direct {p0, p1, p2}, Lcom/tekartik/sqflite/SqflitePlugin;->onExecuteCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x4ea7088b -> :sswitch_f
        -0x4ab8246d -> :sswitch_e
        -0x4a797962 -> :sswitch_d
        -0x468f3d47 -> :sswitch_c
        -0x31ffc737 -> :sswitch_b
        -0x179ee453 -> :sswitch_a
        -0xfb4dfba -> :sswitch_9
        -0xbd41d6a -> :sswitch_8
        -0x1064e1b -> :sswitch_7
        0x592d73a -> :sswitch_6
        0x5b09653 -> :sswitch_5
        0x66f18c8 -> :sswitch_4
        0x3901a9b7 -> :sswitch_3
        0x47241251 -> :sswitch_2
        0x529446af -> :sswitch_1
        0x6f17c6e7 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method onOptionsCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    const-string v0, "androidThreadPriority"

    .line 661
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 663
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sput v0, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_PRIORITY:I

    :cond_0
    const-string v0, "androidThreadCount"

    .line 665
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 666
    sget v2, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_COUNT:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 667
    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sput v0, Lcom/tekartik/sqflite/SqflitePlugin;->THREAD_COUNT:I

    .line 669
    sget-object v0, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    if-eqz v0, :cond_1

    .line 670
    invoke-interface {v0}, Lcom/tekartik/sqflite/DatabaseWorkerPool;->quit()V

    .line 671
    sput-object v1, Lcom/tekartik/sqflite/SqflitePlugin;->databaseWorkerPool:Lcom/tekartik/sqflite/DatabaseWorkerPool;

    .line 674
    :cond_1
    invoke-static {p1}, Lcom/tekartik/sqflite/LogLevel;->getLogLevel(Lio/flutter/plugin/common/MethodCall;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 676
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/tekartik/sqflite/SqflitePlugin;->logLevel:I

    .line 678
    :cond_2
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method
