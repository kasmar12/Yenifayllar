.class public Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;
.super Ljava/lang/Object;
.source "DocumentSnapshotsStreamHandler.java"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# instance fields
.field documentReference:Lcom/google/firebase/firestore/DocumentReference;

.field firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

.field listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

.field metadataChanges:Lcom/google/firebase/firestore/MetadataChanges;

.field serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestore;Lcom/google/firebase/firestore/DocumentReference;Ljava/lang/Boolean;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->firestore:Lcom/google/firebase/firestore/FirebaseFirestore;

    .line 37
    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->documentReference:Lcom/google/firebase/firestore/DocumentReference;

    .line 39
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/google/firebase/firestore/MetadataChanges;->INCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/google/firebase/firestore/MetadataChanges;->EXCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    :goto_0
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->metadataChanges:Lcom/google/firebase/firestore/MetadataChanges;

    .line 40
    iput-object p4, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-void
.end method


# virtual methods
.method public synthetic lambda$onListen$0$io-flutter-plugins-firebase-firestore-streamhandler-DocumentSnapshotsStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 1

    if-eqz p3, :cond_0

    .line 50
    invoke-static {p3}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->createDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    .line 51
    invoke-virtual {p3}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object p3

    const-string v0, "firebase_firestore"

    invoke-interface {p1, v0, p3, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 52
    invoke-interface {p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->endOfStream()V

    const/4 p1, 0x0

    .line 54
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->onCancel(Ljava/lang/Object;)V

    goto :goto_0

    .line 56
    :cond_0
    iget-object p3, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 57
    invoke-static {p2, p3}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object p2

    .line 58
    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;->toList()Ljava/util/ArrayList;

    move-result-object p2

    .line 56
    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    .line 65
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    if-eqz p1, :cond_0

    .line 66
    invoke-interface {p1}, Lcom/google/firebase/firestore/ListenerRegistration;->remove()V

    const/4 p1, 0x0

    .line 67
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    :cond_0
    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 2

    .line 45
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->documentReference:Lcom/google/firebase/firestore/DocumentReference;

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->metadataChanges:Lcom/google/firebase/firestore/MetadataChanges;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/firestore/DocumentReference;->addSnapshotListener(Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/EventListener;)Lcom/google/firebase/firestore/ListenerRegistration;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/DocumentSnapshotsStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    return-void
.end method
