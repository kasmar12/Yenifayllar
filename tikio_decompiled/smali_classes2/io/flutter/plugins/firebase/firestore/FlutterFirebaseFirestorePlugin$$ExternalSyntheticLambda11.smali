.class public final synthetic Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/firebase/firestore/AggregateQuery;

.field public final synthetic f$1:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;

.field public final synthetic f$2:Ljava/util/List;

.field public final synthetic f$3:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/firestore/AggregateQuery;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$0:Lcom/google/firebase/firestore/AggregateQuery;

    iput-object p2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$1:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;

    iput-object p3, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$2:Ljava/util/List;

    iput-object p4, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$3:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$0:Lcom/google/firebase/firestore/AggregateQuery;

    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$1:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;

    iget-object v2, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$2:Ljava/util/List;

    iget-object v3, p0, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin$$ExternalSyntheticLambda11;->f$3:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;

    invoke-static {v0, v1, v2, v3}, Lio/flutter/plugins/firebase/firestore/FlutterFirebaseFirestorePlugin;->lambda$aggregateQuery$17(Lcom/google/firebase/firestore/AggregateQuery;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V

    return-void
.end method
