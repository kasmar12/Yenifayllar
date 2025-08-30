.class public Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApi;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApiCodec;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentOption;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateType;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionType;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;,
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 44
    instance-of v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;

    if-eqz v1, :cond_0

    .line 45
    check-cast p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;

    .line 46
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    iget-object p0, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FlutterError;->details:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cause: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", Stacktrace: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-object v0
.end method
