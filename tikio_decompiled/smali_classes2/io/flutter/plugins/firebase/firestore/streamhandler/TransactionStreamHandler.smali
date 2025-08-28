.class public Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;
.super Ljava/lang/Object;
.source "TransactionStreamHandler.java"

# interfaces
.implements Lio/flutter/plugins/firebase/firestore/streamhandler/OnTransactionResultListener;
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;
    }
.end annotation


# instance fields
.field private commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;",
            ">;"
        }
    .end annotation
.end field

.field final firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

.field final mainLooper:Landroid/os/Handler;

.field final maxAttempts:Ljava/lang/Long;

.field final onTransactionStartedListener:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;

.field private resultType:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;

.field final semaphore:Ljava/util/concurrent/Semaphore;

.field final timeout:Ljava/lang/Long;

.field final transactionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 2

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->mainLooper:Landroid/os/Handler;

    .line 53
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->onTransactionStartedListener:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;

    .line 54
    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 55
    iput-object p3, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->transactionId:Ljava/lang/String;

    .line 56
    iput-object p4, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->timeout:Ljava/lang/Long;

    .line 57
    iput-object p5, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->maxAttempts:Ljava/lang/Long;

    return-void
.end method

.method static synthetic lambda$onListen$0(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/util/Map;)V
    .locals 0

    .line 77
    invoke-interface {p0, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onListen$2(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/util/HashMap;)V
    .locals 0

    .line 152
    invoke-interface {p0, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    .line 153
    invoke-interface {p0}, Lio/flutter/plugin/common/EventChannel$EventSink;->endOfStream()V

    return-void
.end method


# virtual methods
.method public synthetic lambda$onListen$1$io-flutter-plugins-firebase-firestore-streamhandler-TransactionStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/firestore/Transaction;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/firestore/FirebaseFirestoreException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->onTransactionStartedListener:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;

    invoke-interface {v0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;->onStarted(Lcom/google/firebase/firestore/Transaction;)V

    .line 74
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 75
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "appName"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->mainLooper:Landroid/os/Handler;

    new-instance v2, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1, v0}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 80
    :try_start_0
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->timeout:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 81
    new-instance p1, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    const-string p2, "timed out"

    sget-object v0, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    invoke-direct {p1, p2, v0}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->failed(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 89
    :cond_0
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->commands:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 90
    invoke-static {}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->complete()Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    move-result-object p1

    return-object p1

    .line 93
    :cond_1
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->resultType:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;

    sget-object v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;->FAILURE:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;

    if-ne p1, v0, :cond_2

    .line 94
    invoke-static {}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->complete()Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    move-result-object p1

    return-object p1

    .line 97
    :cond_2
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->commands:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;

    .line 98
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/firebase/firestore/FirebaseFirestore;->document(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentReference;

    move-result-object v1

    .line 100
    sget-object v2, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$PigeonTransactionType:[I

    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getType()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionType;

    move-result-object v3

    invoke-virtual {v3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x1

    if-eq v2, v3, :cond_8

    const/4 v3, 0x2

    if-eq v2, v3, :cond_7

    const/4 v3, 0x3

    if-eq v2, v3, :cond_3

    goto :goto_0

    .line 111
    :cond_3
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getOption()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;

    const/4 v3, 0x0

    .line 114
    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMerge()Ljava/lang/Boolean;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMerge()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 115
    invoke-static {}, Lcom/google/firebase/firestore/SetOptions;->merge()Lcom/google/firebase/firestore/SetOptions;

    move-result-object v3

    goto :goto_1

    .line 116
    :cond_4
    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMergeFields()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 118
    invoke-virtual {v2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;->getMergeFields()Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    check-cast v3, Ljava/util/List;

    .line 119
    invoke-static {v2}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->parseFieldPath(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 121
    invoke-static {v2}, Lcom/google/firebase/firestore/SetOptions;->mergeFieldPaths(Ljava/util/List;)Lcom/google/firebase/firestore/SetOptions;

    move-result-object v3

    .line 124
    :cond_5
    :goto_1
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getData()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/util/Map;

    if-nez v3, :cond_6

    .line 127
    invoke-virtual {p2, v1, v0}, Lcom/google/firebase/firestore/Transaction;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;)Lcom/google/firebase/firestore/Transaction;

    goto :goto_0

    .line 129
    :cond_6
    invoke-virtual {p2, v1, v0, v3}, Lcom/google/firebase/firestore/Transaction;->set(Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Object;Lcom/google/firebase/firestore/SetOptions;)Lcom/google/firebase/firestore/Transaction;

    goto :goto_0

    .line 106
    :cond_7
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;->getData()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Ljava/util/Map;

    .line 105
    invoke-virtual {p2, v1, v0}, Lcom/google/firebase/firestore/Transaction;->update(Lcom/google/firebase/firestore/DocumentReference;Ljava/util/Map;)Lcom/google/firebase/firestore/Transaction;

    goto/16 :goto_0

    .line 102
    :cond_8
    invoke-virtual {p2, v1}, Lcom/google/firebase/firestore/Transaction;->delete(Lcom/google/firebase/firestore/DocumentReference;)Lcom/google/firebase/firestore/Transaction;

    goto/16 :goto_0

    .line 136
    :cond_9
    invoke-static {}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->complete()Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    move-result-object p1

    return-object p1

    .line 85
    :catch_0
    new-instance p1, Lcom/google/firebase/firestore/FirebaseFirestoreException;

    sget-object p2, Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;->DEADLINE_EXCEEDED:Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;

    const-string v0, "interrupted"

    invoke-direct {p1, v0, p2}, Lcom/google/firebase/firestore/FirebaseFirestoreException;-><init>(Ljava/lang/String;Lcom/google/firebase/firestore/FirebaseFirestoreException$Code;)V

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->failed(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    move-result-object p1

    return-object p1
.end method

.method public synthetic lambda$onListen$3$io-flutter-plugins-firebase-firestore-streamhandler-TransactionStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 140
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 141
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    iget-object v1, v1, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->exception:Ljava/lang/Exception;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 146
    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_3

    const/4 p2, 0x1

    .line 147
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    const-string v1, "complete"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 143
    :cond_1
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p2

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    iget-object p2, p2, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;->exception:Ljava/lang/Exception;

    .line 144
    :goto_1
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->getApp()Lcom/google/firebase/FirebaseApp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "appName"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    invoke-static {p2}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->createDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    const-string v1, "error"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    :cond_3
    :goto_2
    iget-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->mainLooper:Landroid/os/Handler;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1, v0}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/util/HashMap;)V

    invoke-virtual {p2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    .line 160
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {p1}, Ljava/util/concurrent/Semaphore;->release()V

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 2

    .line 68
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    new-instance v0, Lcom/google/firebase/firestore/TransactionOptions$Builder;

    invoke-direct {v0}, Lcom/google/firebase/firestore/TransactionOptions$Builder;-><init>()V

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->maxAttempts:Ljava/lang/Long;

    .line 70
    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/firestore/TransactionOptions$Builder;->setMaxAttempts(I)Lcom/google/firebase/firestore/TransactionOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/firebase/firestore/TransactionOptions$Builder;->build()Lcom/google/firebase/firestore/TransactionOptions;

    move-result-object v0

    new-instance v1, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    .line 69
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/firestore/FirebaseFirestore;->runTransaction(Lcom/google/firebase/firestore/TransactionOptions;Lcom/google/firebase/firestore/Transaction$Function;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    .line 138
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public receiveTransactionResponse(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;",
            ">;)V"
        }
    .end annotation

    .line 167
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->resultType:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;

    .line 168
    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->commands:Ljava/util/List;

    .line 169
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->semaphore:Ljava/util/concurrent/Semaphore;

    invoke-virtual {p1}, Ljava/util/concurrent/Semaphore;->release()V

    return-void
.end method
