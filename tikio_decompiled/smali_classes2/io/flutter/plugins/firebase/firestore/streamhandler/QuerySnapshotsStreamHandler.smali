.class public Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;
.super Ljava/lang/Object;
.source "QuerySnapshotsStreamHandler.java"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# instance fields
.field listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

.field metadataChanges:Lcom/google/firebase/firestore/MetadataChanges;

.field query:Lcom/google/firebase/firestore/Query;

.field serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/Query;Ljava/lang/Boolean;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->query:Lcom/google/firebase/firestore/Query;

    .line 37
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/google/firebase/firestore/MetadataChanges;->INCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/google/firebase/firestore/MetadataChanges;->EXCLUDE:Lcom/google/firebase/firestore/MetadataChanges;

    :goto_0
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->metadataChanges:Lcom/google/firebase/firestore/MetadataChanges;

    .line 38
    iput-object p3, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-void
.end method


# virtual methods
.method public synthetic lambda$onListen$0$io-flutter-plugins-firebase-firestore-streamhandler-QuerySnapshotsStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/FirebaseFirestoreException;)V
    .locals 5

    if-eqz p3, :cond_0

    .line 48
    invoke-static {p3}, Lio/flutter/plugins/firebase/firestore/utils/ExceptionConverter;->createDetails(Ljava/lang/Exception;)Ljava/util/Map;

    move-result-object p2

    .line 49
    invoke-virtual {p3}, Lcom/google/firebase/firestore/FirebaseFirestoreException;->getMessage()Ljava/lang/String;

    move-result-object p3

    const-string v0, "firebase_firestore"

    invoke-interface {p1, v0, p3, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    invoke-interface {p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->endOfStream()V

    const/4 p1, 0x0

    .line 52
    invoke-virtual {p0, p1}, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->onCancel(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 54
    :cond_0
    new-instance p3, Ljava/util/ArrayList;

    const/4 v0, 0x3

    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    .line 56
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocuments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 57
    new-instance v1, Ljava/util/ArrayList;

    .line 58
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocumentChanges()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 59
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocuments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/DocumentSnapshot;

    .line 60
    iget-object v4, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 61
    invoke-static {v3, v4}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object v3

    .line 63
    invoke-virtual {v3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;->toList()Ljava/util/ArrayList;

    move-result-object v3

    .line 60
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocumentChanges()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/DocumentChange;

    .line 66
    iget-object v4, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->serverTimestampBehavior:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 67
    invoke-static {v3, v4}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentChange(Lcom/google/firebase/firestore/DocumentChange;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    move-result-object v3

    .line 68
    invoke-virtual {v3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->toList()Ljava/util/ArrayList;

    move-result-object v3

    .line 66
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 70
    :cond_2
    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    invoke-virtual {p2}, Lcom/google/firebase/firestore/QuerySnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object p2

    invoke-static {p2}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonSnapshotMetadata(Lcom/google/firebase/firestore/SnapshotMetadata;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    move-result-object p2

    invoke-virtual {p2}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;->toList()Ljava/util/ArrayList;

    move-result-object p2

    .line 72
    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    invoke-interface {p1, p3}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :goto_2
    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    .line 82
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    if-eqz p1, :cond_0

    .line 83
    invoke-interface {p1}, Lcom/google/firebase/firestore/ListenerRegistration;->remove()V

    const/4 p1, 0x0

    .line 84
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    :cond_0
    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 2

    .line 43
    iget-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->query:Lcom/google/firebase/firestore/Query;

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->metadataChanges:Lcom/google/firebase/firestore/MetadataChanges;

    new-instance v1, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    .line 44
    invoke-virtual {p1, v0, v1}, Lcom/google/firebase/firestore/Query;->addSnapshotListener(Lcom/google/firebase/firestore/MetadataChanges;Lcom/google/firebase/firestore/EventListener;)Lcom/google/firebase/firestore/ListenerRegistration;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/QuerySnapshotsStreamHandler;->listenerRegistration:Lcom/google/firebase/firestore/ListenerRegistration;

    return-void
.end method
