.class public interface abstract Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirebaseFirestoreHostApi;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FirebaseFirestoreHostApi"
.end annotation


# virtual methods
.method public abstract aggregateQuery(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;Ljava/util/List;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQuery;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateQueryResponse;",
            ">;>;)V"
        }
    .end annotation
.end method

.method public abstract clearPersistence(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract disableNetwork(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract documentReferenceDelete(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract documentReferenceGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract documentReferenceSet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract documentReferenceSnapshot(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract documentReferenceUpdate(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentReferenceRequest;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract enableNetwork(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract loadBundle(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;[BLio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "[B",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract namedQueryGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract queryGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract querySnapshot(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonGetOptions;",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setIndexConfiguration(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setLoggingEnabled(Ljava/lang/Boolean;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Boolean;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract snapshotsInSyncSetup(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract terminate(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract transactionCreate(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract transactionGet(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract transactionStoreResult(Ljava/lang/String;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionResult;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;",
            ">;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract waitForPendingWrites(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract writeBatchCommit(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;Ljava/util/List;Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$FirestorePigeonFirebaseApp;",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonTransactionCommand;",
            ">;",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Result<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation
.end method
