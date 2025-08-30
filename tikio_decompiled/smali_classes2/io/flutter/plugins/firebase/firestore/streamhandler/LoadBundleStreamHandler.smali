.class public Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;
.super Ljava/lang/Object;
.source "LoadBundleStreamHandler.java"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# instance fields
.field private final bundle:[B

.field private eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

.field private final firestore:Lcom/google/firebase/firestore/FirebaseFirestore;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestore;[B)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 22
    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->bundle:[B

    return-void
.end method


# virtual methods
.method public synthetic lambda$onListen$0$io-flutter-plugins-firebase-firestore-streamhandler-LoadBundleStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/Exception;)V
    .locals 2

    .line 39
    invoke-static {p2}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->createDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object v0

    .line 40
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    const-string v1, "firebase_firestore"

    invoke-interface {p1, v1, p2, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->onCancel(Ljava/lang/Object;)V

    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    .line 47
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->endOfStream()V

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 1

    .line 32
    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    .line 33
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;->bundle:[B

    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/FirebaseFirestore;->loadBundle([B)Lcom/google/firebase/firestore/LoadBundleTask;

    move-result-object p1

    .line 35
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/LoadBundleTask;->addOnProgressListener(Lcom/google/firebase/firestore/OnProgressListener;)Lcom/google/firebase/firestore/LoadBundleTask;

    .line 37
    new-instance v0, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/firestore/streamhandler/LoadBundleStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    invoke-virtual {p1, v0}, Lcom/google/firebase/firestore/LoadBundleTask;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
