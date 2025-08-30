.class public final Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private document:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

.field private newIndex:Ljava/lang/Long;

.field private oldIndex:Ljava/lang/Long;

.field private type:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 641
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;
    .locals 2

    .line 672
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;-><init>()V

    .line 673
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->type:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;)V

    .line 674
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->document:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->setDocument(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;)V

    .line 675
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->oldIndex:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->setOldIndex(Ljava/lang/Long;)V

    .line 676
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->newIndex:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;->setNewIndex(Ljava/lang/Long;)V

    return-object v0
.end method

.method public setDocument(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;
    .locals 0

    .line 653
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->document:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    return-object p0
.end method

.method public setNewIndex(Ljava/lang/Long;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;
    .locals 0

    .line 667
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->newIndex:Ljava/lang/Long;

    return-object p0
.end method

.method public setOldIndex(Ljava/lang/Long;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;
    .locals 0

    .line 660
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->oldIndex:Ljava/lang/Long;

    return-object p0
.end method

.method public setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;
    .locals 0

    .line 646
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->type:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;

    return-object p0
.end method
