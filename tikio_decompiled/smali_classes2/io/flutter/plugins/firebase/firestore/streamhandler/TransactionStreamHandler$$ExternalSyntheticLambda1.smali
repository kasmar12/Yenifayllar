.class public final synthetic Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/firebase/firestore/Transaction$Function;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

.field public final synthetic f$1:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public final apply(Lcom/google/firebase/firestore/Transaction;)Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$$ExternalSyntheticLambda1;->f$1:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler;->lambda$onListen$1$io-flutter-plugins-firebase-firestore-streamhandler-TransactionStreamHandler(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/google/firebase/firestore/Transaction;)Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestoreTransactionResult;

    move-result-object p1

    return-object p1
.end method
