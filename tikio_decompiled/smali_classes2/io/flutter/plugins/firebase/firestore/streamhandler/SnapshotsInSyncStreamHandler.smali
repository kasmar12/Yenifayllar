.class public Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;
.super Ljava/lang/Object;
.source "SnapshotsInSyncStreamHandler.java"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# instance fields
.field firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

.field listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestore;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    return-void
.end method

.method static synthetic lambda$onListen$0(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-interface {p0, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    .line 32
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    if-eqz p1, :cond_0

    .line 33
    invoke-interface {p1}, Lcom/google/firebase/firestore/ListenerRegistration;->remove()V

    const/4 p1, 0x0

    .line 34
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    :cond_0
    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    .line 25
    new-instance p1, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler$$ExternalSyntheticLambda0;

    invoke-direct {p1, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    .line 27
    iget-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    invoke-virtual {p2, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->addSnapshotsInSyncListener(Ljava/lang/Runnable;)Lcom/google/firebase/firestore/ListenerRegistration;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/SnapshotsInSyncStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    return-void
.end method
