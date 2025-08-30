.class public Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;
.super Ljava/lang/Object;
.source "PigeonParser.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static filterFromJson(Ljava/util/Map;)Lcom/google/firebase/firestore/Filter;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/firebase/firestore/Filter;"
        }
    .end annotation

    const-string v0, "fieldPath"

    .line 258
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "Invalid operator"

    const-string v3, "op"

    const/4 v4, 0x0

    if-eqz v1, :cond_a

    .line 260
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 261
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/firestore/FieldPath;

    const-string v3, "value"

    .line 262
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 268
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    const/4 v3, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :goto_0
    const/4 v4, -0x1

    goto/16 :goto_1

    :sswitch_0
    const-string v4, "array-contains-any"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v4, 0x9

    goto/16 :goto_1

    :sswitch_1
    const-string v4, "array-contains"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const/16 v4, 0x8

    goto :goto_1

    :sswitch_2
    const-string v4, "in"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x7

    goto :goto_1

    :sswitch_3
    const-string v4, ">="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x6

    goto :goto_1

    :sswitch_4
    const-string v4, "=="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v4, 0x5

    goto :goto_1

    :sswitch_5
    const-string v4, "<="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v4, 0x4

    goto :goto_1

    :sswitch_6
    const-string v4, "!="

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    goto :goto_0

    :cond_6
    const/4 v4, 0x3

    goto :goto_1

    :sswitch_7
    const-string v4, ">"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    goto :goto_0

    :cond_7
    const/4 v4, 0x2

    goto :goto_1

    :sswitch_8
    const-string v4, "<"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    goto :goto_0

    :cond_8
    const/4 v4, 0x1

    goto :goto_1

    :sswitch_9
    const-string v5, "not-in"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    goto :goto_0

    :cond_9
    :goto_1
    packed-switch v4, :pswitch_data_0

    .line 290
    new-instance p0, Ljava/lang/Error;

    invoke-direct {p0, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw p0

    .line 284
    :pswitch_0
    check-cast p0, Ljava/util/List;

    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->arrayContainsAny(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 282
    :pswitch_1
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->arrayContains(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 286
    :pswitch_2
    check-cast p0, Ljava/util/List;

    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->inArray(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 280
    :pswitch_3
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->greaterThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 270
    :pswitch_4
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->equalTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 276
    :pswitch_5
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->lessThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 272
    :pswitch_6
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->notEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 278
    :pswitch_7
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->greaterThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 274
    :pswitch_8
    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->lessThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 288
    :pswitch_9
    check-cast p0, Ljava/util/List;

    invoke-static {v0, p0}, Lcom/google/firebase/firestore/Filter;->notInArray(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 294
    :cond_a
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "queries"

    .line 295
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    .line 298
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 299
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 300
    invoke-static {v3}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->filterFromJson(Ljava/util/Map;)Lcom/google/firebase/firestore/Filter;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_b
    const-string p0, "OR"

    .line 303
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    new-array p0, v4, [Lcom/google/firebase/firestore/Filter;

    .line 304
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/google/firebase/firestore/Filter;

    invoke-static {p0}, Lcom/google/firebase/firestore/Filter;->or([Lcom/google/firebase/firestore/Filter;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    :cond_c
    const-string p0, "AND"

    .line 305
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    new-array p0, v4, [Lcom/google/firebase/firestore/Filter;

    .line 306
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/google/firebase/firestore/Filter;

    invoke-static {p0}, Lcom/google/firebase/firestore/Filter;->and([Lcom/google/firebase/firestore/Filter;)Lcom/google/firebase/firestore/Filter;

    move-result-object p0

    return-object p0

    .line 309
    :cond_d
    new-instance p0, Ljava/lang/Error;

    invoke-direct {p0, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw p0

    :sswitch_data_0
    .sparse-switch
        -0x3df949a1 -> :sswitch_9
        0x3c -> :sswitch_8
        0x3e -> :sswitch_7
        0x43c -> :sswitch_6
        0x781 -> :sswitch_5
        0x7a0 -> :sswitch_4
        0x7bf -> :sswitch_3
        0xd25 -> :sswitch_2
        0x8111b13 -> :sswitch_1
        0x152d4832 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parseAggregateSource(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;)Lcom/google/firebase/firestore/AggregateSource;
    .locals 3

    .line 314
    sget-object v0, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$AggregateSource:[I

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$AggregateSource;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 316
    sget-object p0, Lcom/google/firebase/firestore/AggregateSource;->SERVER:Lcom/google/firebase/firestore/AggregateSource;

    return-object p0

    .line 318
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown AggregateSource value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static parseFieldPath(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/FieldPath;",
            ">;"
        }
    .end annotation

    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 145
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    .line 146
    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-static {v1}, Lcom/google/firebase/firestore/FieldPath;->of([Ljava/lang/String;)Lcom/google/firebase/firestore/FieldPath;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static parsePigeonServerTimestampBehavior(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;
    .locals 3

    if-nez p0, :cond_0

    .line 43
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0

    .line 45
    :cond_0
    sget-object v0, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior:[I

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$ServerTimestampBehavior;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 51
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->PREVIOUS:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0

    .line 53
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown server timestamp behavior: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_2
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->ESTIMATE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0

    .line 47
    :cond_3
    sget-object p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0
.end method

.method public static parsePigeonSource(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;)Lcom/google/firebase/firestore/Source;
    .locals 3

    .line 28
    sget-object v0, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser$1;->$SwitchMap$io$flutter$plugins$firebase$firestore$GeneratedAndroidFirebaseFirestore$Source:[I

    invoke-virtual {p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$Source;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 34
    sget-object p0, Lcom/google/firebase/firestore/Source;->SERVER:Lcom/google/firebase/firestore/Source;

    return-object p0

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown source: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_1
    sget-object p0, Lcom/google/firebase/firestore/Source;->DEFAULT:Lcom/google/firebase/firestore/Source;

    return-object p0

    .line 30
    :cond_2
    sget-object p0, Lcom/google/firebase/firestore/Source;->CACHE:Lcom/google/firebase/firestore/Source;

    return-object p0
.end method

.method public static parseQuery(Lcom/google/firebase/firestore/FirebaseFirestore;Ljava/lang/String;ZLio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;)Lcom/google/firebase/firestore/Query;
    .locals 6

    const-string v0, "FLTFirestoreMsgCodec"

    if-eqz p2, :cond_0

    .line 159
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->collectionGroup(Ljava/lang/String;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_0

    .line 161
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestore;->collection(Ljava/lang/String;)Lcom/google/firebase/firestore/CollectionReference;

    move-result-object p0

    :goto_0
    if-nez p3, :cond_1

    return-object p0

    .line 166
    :cond_1
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getFilters()Ljava/util/Map;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    if-eqz p1, :cond_3

    .line 168
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getFilters()Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->filterFromJson(Ljava/util/Map;)Lcom/google/firebase/firestore/Filter;

    move-result-object p1

    .line 169
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/Query;->where(Lcom/google/firebase/firestore/Filter;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    .line 172
    :cond_3
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getWhere()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Ljava/util/List;

    .line 174
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 175
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    .line 176
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const/4 v5, 0x2

    .line 177
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v5, "=="

    .line 179
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 180
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_4
    const-string v5, "!="

    .line 181
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 182
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereNotEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_5
    const-string v5, "<"

    .line 183
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 184
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereLessThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_6
    const-string v5, "<="

    .line 185
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 186
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereLessThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_7
    const-string v5, ">"

    .line 187
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 188
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereGreaterThan(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_8
    const-string v5, ">="

    .line 189
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 190
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereGreaterThanOrEqualTo(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_9
    const-string v5, "array-contains"

    .line 191
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 192
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereArrayContains(Lcom/google/firebase/firestore/FieldPath;Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_2

    :cond_a
    const-string v5, "array-contains-any"

    .line 193
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 195
    check-cast v2, Ljava/util/List;

    .line 196
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereArrayContainsAny(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto/16 :goto_2

    :cond_b
    const-string v5, "in"

    .line 197
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 199
    check-cast v2, Ljava/util/List;

    .line 200
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereIn(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto/16 :goto_2

    :cond_c
    const-string v5, "not-in"

    .line 201
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 203
    check-cast v2, Ljava/util/List;

    .line 204
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->whereNotIn(Lcom/google/firebase/firestore/FieldPath;Ljava/util/List;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto/16 :goto_2

    .line 206
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "An invalid query operator "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " was received but not handled."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 213
    :cond_e
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getLimit()Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_f

    .line 214
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/google/firebase/firestore/Query;->limit(J)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    .line 216
    :cond_f
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getLimitToLast()Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_10

    .line 217
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/google/firebase/firestore/Query;->limitToLast(J)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    .line 220
    :cond_10
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getOrderBy()Ljava/util/List;

    move-result-object p1

    if-nez p1, :cond_11

    return-object p0

    .line 223
    :cond_11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 224
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/firebase/firestore/FieldPath;

    .line 225
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 228
    sget-object v2, Lcom/google/firebase/firestore/Query$Direction;->DESCENDING:Lcom/google/firebase/firestore/Query$Direction;

    goto :goto_4

    :cond_12
    sget-object v2, Lcom/google/firebase/firestore/Query$Direction;->ASCENDING:Lcom/google/firebase/firestore/Query$Direction;

    .line 230
    :goto_4
    invoke-virtual {p0, v3, v2}, Lcom/google/firebase/firestore/Query;->orderBy(Lcom/google/firebase/firestore/FieldPath;Lcom/google/firebase/firestore/Query$Direction;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    goto :goto_3

    .line 234
    :cond_13
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getStartAt()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 235
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/Query;->startAt([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    .line 237
    :cond_14
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getStartAfter()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_15

    .line 239
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/Query;->startAfter([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    .line 241
    :cond_15
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getEndAt()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_16

    .line 242
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/Query;->endAt([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0

    .line 244
    :cond_16
    invoke-virtual {p3}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQueryParameters;->getEndBefore()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_17

    .line 245
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/Query;->endBefore([Ljava/lang/Object;)Lcom/google/firebase/firestore/Query;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_17
    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "An error occurred while parsing query arguments, this is most likely an error with this SDK."

    .line 249
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public static toPigeonDocumentChange(Lcom/google/firebase/firestore/DocumentChange;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;
    .locals 3

    .line 95
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;-><init>()V

    .line 97
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentChange;->getType()Lcom/google/firebase/firestore/DocumentChange$Type;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentChangeType(Lcom/google/firebase/firestore/DocumentChange$Type;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->setType(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;

    .line 98
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentChange;->getOldIndex()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->setOldIndex(Ljava/lang/Long;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;

    .line 99
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentChange;->getNewIndex()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->setNewIndex(Ljava/lang/Long;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;

    .line 101
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentChange;->getDocument()Lcom/google/firebase/firestore/QueryDocumentSnapshot;

    move-result-object p0

    invoke-static {p0, p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object p0

    .line 100
    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->setDocument(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;

    .line 102
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    move-result-object p0

    return-object p0
.end method

.method public static toPigeonDocumentChangeType(Lcom/google/firebase/firestore/DocumentChange$Type;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;
    .locals 3

    .line 107
    sget-object v0, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser$1;->$SwitchMap$com$google$firebase$firestore$DocumentChange$Type:[I

    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentChange$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 113
    sget-object p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;->REMOVED:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;

    return-object p0

    .line 115
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown change type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_1
    sget-object p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;->MODIFIED:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;

    return-object p0

    .line 109
    :cond_2
    sget-object p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;->ADDED:Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$DocumentChangeType;

    return-object p0
.end method

.method public static toPigeonDocumentChanges(Ljava/util/List;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/DocumentChange;",
            ">;",
            "Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;",
            ")",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;",
            ">;"
        }
    .end annotation

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    .line 85
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 86
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/DocumentChange;

    .line 87
    invoke-static {v1, p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentChange(Lcom/google/firebase/firestore/DocumentChange;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentChange;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;
    .locals 2

    .line 122
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;-><init>()V

    .line 124
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentSnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonSnapshotMetadata(Lcom/google/firebase/firestore/SnapshotMetadata;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;->setMetadata(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;

    .line 125
    invoke-virtual {p0, p1}, Lcom/google/firebase/firestore/DocumentSnapshot;->getData(Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;->setData(Ljava/util/Map;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;

    .line 126
    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentSnapshot;->getReference()Lcom/google/firebase/firestore/DocumentReference;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/firebase/firestore/DocumentReference;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;->setPath(Ljava/lang/String;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;

    .line 127
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object p0

    return-object p0
.end method

.method public static toPigeonDocumentSnapshots(Ljava/util/List;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/DocumentSnapshot;",
            ">;",
            "Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;",
            ")",
            "Ljava/util/List<",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;",
            ">;"
        }
    .end annotation

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    .line 135
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 136
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/DocumentSnapshot;

    .line 138
    invoke-static {v1, p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshot(Lcom/google/firebase/firestore/DocumentSnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonDocumentSnapshot;

    move-result-object v1

    .line 137
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static toPigeonQuerySnapshot(Lcom/google/firebase/firestore/QuerySnapshot;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;
    .locals 2

    .line 61
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;-><init>()V

    .line 63
    invoke-virtual {p0}, Lcom/google/firebase/firestore/QuerySnapshot;->getMetadata()Lcom/google/firebase/firestore/SnapshotMetadata;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonSnapshotMetadata(Lcom/google/firebase/firestore/SnapshotMetadata;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;->setMetadata(Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;

    .line 65
    invoke-virtual {p0}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocumentChanges()Ljava/util/List;

    move-result-object v1

    invoke-static {v1, p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentChanges(Ljava/util/List;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/List;

    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;->setDocumentChanges(Ljava/util/List;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;

    .line 67
    invoke-virtual {p0}, Lcom/google/firebase/firestore/QuerySnapshot;->getDocuments()Ljava/util/List;

    move-result-object p0

    invoke-static {p0, p1}, Lio/flutter/plugins/firebase/firestore/utils/PigeonParser;->toPigeonDocumentSnapshots(Ljava/util/List;Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;)Ljava/util/List;

    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;->setDocuments(Ljava/util/List;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;

    .line 68
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonQuerySnapshot;

    move-result-object p0

    return-object p0
.end method

.method public static toPigeonSnapshotMetadata(Lcom/google/firebase/firestore/SnapshotMetadata;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;
    .locals 2

    .line 73
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;-><init>()V

    .line 75
    invoke-virtual {p0}, Lcom/google/firebase/firestore/SnapshotMetadata;->hasPendingWrites()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;->setHasPendingWrites(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;

    .line 76
    invoke-virtual {p0}, Lcom/google/firebase/firestore/SnapshotMetadata;->isFromCache()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;->setIsFromCache(Ljava/lang/Boolean;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;

    .line 77
    invoke-virtual {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata$Builder;->build()Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonSnapshotMetadata;

    move-result-object p0

    return-object p0
.end method
