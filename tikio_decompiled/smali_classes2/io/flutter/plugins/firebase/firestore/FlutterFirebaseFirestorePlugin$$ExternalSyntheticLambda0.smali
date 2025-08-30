.class public final synthetic Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/plugins/firebase/firestore/streamhandler/TransactionStreamHandler$OnTransactionStartedListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onStarted(Lcom/google/firebase/firestore/Transaction;)V
    .locals 2

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->lambda$transactionCreate$10$io-flutter-plugins-firebase-firestore-FlutterFirebaseFirestorePlugin(Ljava/lang/String;Lcom/google/firebase/firestore/Transaction;)V

    return-void
.end method
