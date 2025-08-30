.class public Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;
.super Ljava/lang/Object;
.source "UserData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/core/UserData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParseAccumulator"
.end annotation


# instance fields
.field private final dataSource:Lcom/google/firebase/firestore/core/UserData$Source;

.field private final fieldMask:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/firebase/firestore/model/FieldPath;",
            ">;"
        }
    .end annotation
.end field

.field private final fieldTransforms:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/firebase/firestore/model/mutation/FieldTransform;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/firebase/firestore/core/UserData$Source;)V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->dataSource:Lcom/google/firebase/firestore/core/UserData$Source;

    .line 87
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldMask:Ljava/util/Set;

    .line 88
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    return-void
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;)Lcom/google/firebase/firestore/core/UserData$Source;
    .locals 0

    .line 71
    iget-object p0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->dataSource:Lcom/google/firebase/firestore/core/UserData$Source;

    return-object p0
.end method


# virtual methods
.method addToFieldMask(Lcom/google/firebase/firestore/model/FieldPath;)V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldMask:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addToFieldTransforms(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/model/mutation/TransformOperation;)V
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    new-instance v1, Lcom/google/firebase/firestore/model/mutation/FieldTransform;

    invoke-direct {v1, p1, p2}, Lcom/google/firebase/firestore/model/mutation/FieldTransform;-><init>(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/model/mutation/TransformOperation;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public contains(Lcom/google/firebase/firestore/model/FieldPath;)Z
    .locals 3

    .line 108
    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldMask:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/FieldPath;

    .line 109
    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/model/FieldPath;->isPrefixOf(Lcom/google/firebase/firestore/model/BasePath;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v2

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/firebase/firestore/model/mutation/FieldTransform;

    .line 115
    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/google/firebase/firestore/model/FieldPath;->isPrefixOf(Lcom/google/firebase/firestore/model/BasePath;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public getDataSource()Lcom/google/firebase/firestore/core/UserData$Source;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->dataSource:Lcom/google/firebase/firestore/core/UserData$Source;

    return-object v0
.end method

.method public getFieldTransforms()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/firebase/firestore/model/mutation/FieldTransform;",
            ">;"
        }
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    return-object v0
.end method

.method public rootContext()Lcom/google/firebase/firestore/core/UserData$ParseContext;
    .locals 4

    .line 101
    new-instance v0, Lcom/google/firebase/firestore/core/UserData$ParseContext;

    sget-object v1, Lcom/google/firebase/firestore/model/FieldPath;->EMPTY_PATH:Lcom/google/firebase/firestore/model/FieldPath;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/google/firebase/firestore/core/UserData$ParseContext;-><init>(Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;Lcom/google/firebase/firestore/model/FieldPath;ZLcom/google/firebase/firestore/core/UserData$1;)V

    return-object v0
.end method

.method public toMergeData(Lcom/google/firebase/firestore/model/ObjectValue;)Lcom/google/firebase/firestore/core/UserData$ParsedSetData;
    .locals 3

    .line 140
    new-instance v0, Lcom/google/firebase/firestore/core/UserData$ParsedSetData;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldMask:Ljava/util/Set;

    .line 141
    invoke-static {v1}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->fromSet(Ljava/util/Set;)Lcom/google/firebase/firestore/model/mutation/FieldMask;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lcom/google/firebase/firestore/core/UserData$ParsedSetData;-><init>(Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/mutation/FieldMask;Ljava/util/List;)V

    return-object v0
.end method

.method public toMergeData(Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/mutation/FieldMask;)Lcom/google/firebase/firestore/core/UserData$ParsedSetData;
    .locals 4

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 160
    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/firebase/firestore/model/mutation/FieldTransform;

    .line 161
    invoke-virtual {v2}, Lcom/google/firebase/firestore/model/mutation/FieldTransform;->getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->covers(Lcom/google/firebase/firestore/model/FieldPath;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 162
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 166
    :cond_1
    new-instance v1, Lcom/google/firebase/firestore/core/UserData$ParsedSetData;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v1, p1, p2, v0}, Lcom/google/firebase/firestore/core/UserData$ParsedSetData;-><init>(Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/mutation/FieldMask;Ljava/util/List;)V

    return-object v1
.end method

.method public toSetData(Lcom/google/firebase/firestore/model/ObjectValue;)Lcom/google/firebase/firestore/core/UserData$ParsedSetData;
    .locals 3

    .line 176
    new-instance v0, Lcom/google/firebase/firestore/core/UserData$ParsedSetData;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p1, v2, v1}, Lcom/google/firebase/firestore/core/UserData$ParsedSetData;-><init>(Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/mutation/FieldMask;Ljava/util/List;)V

    return-object v0
.end method

.method public toUpdateData(Lcom/google/firebase/firestore/model/ObjectValue;)Lcom/google/firebase/firestore/core/UserData$ParsedUpdateData;
    .locals 3

    .line 186
    new-instance v0, Lcom/google/firebase/firestore/core/UserData$ParsedUpdateData;

    iget-object v1, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldMask:Ljava/util/Set;

    .line 187
    invoke-static {v1}, Lcom/google/firebase/firestore/model/mutation/FieldMask;->fromSet(Ljava/util/Set;)Lcom/google/firebase/firestore/model/mutation/FieldMask;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/firestore/core/UserData$ParseAccumulator;->fieldTransforms:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lcom/google/firebase/firestore/core/UserData$ParsedUpdateData;-><init>(Lcom/google/firebase/firestore/model/ObjectValue;Lcom/google/firebase/firestore/model/mutation/FieldMask;Ljava/util/List;)V

    return-object v0
.end method
