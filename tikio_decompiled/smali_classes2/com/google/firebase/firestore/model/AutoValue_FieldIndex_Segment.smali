.class final Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;
.super Lcom/google/firebase/firestore/model/FieldIndex$Segment;
.source "AutoValue_FieldIndex_Segment.java"


# instance fields
.field private final fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

.field private final kind:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;


# direct methods
.method constructor <init>(Lcom/google/firebase/firestore/model/FieldPath;Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;)V
    .locals 1

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;-><init>()V

    const-string v0, "Null fieldPath"

    .line 18
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    iput-object p1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    const-string p1, "Null kind"

    .line 22
    invoke-static {p2, p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    iput-object p2, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->kind:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 50
    :cond_0
    instance-of v1, p1, Lcom/google/firebase/firestore/model/FieldIndex$Segment;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 51
    check-cast p1, Lcom/google/firebase/firestore/model/FieldIndex$Segment;

    .line 52
    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/google/firebase/firestore/model/FieldPath;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->kind:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    .line 53
    invoke-virtual {p1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment;->getKind()Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getFieldPath()Lcom/google/firebase/firestore/model/FieldPath;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    return-object v0
.end method

.method public getKind()Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->kind:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v0}, Lcom/google/firebase/firestore/model/FieldPath;->hashCode()I

    move-result v0

    const v1, 0xf4243

    xor-int/2addr v0, v1

    mul-int v0, v0, v1

    .line 64
    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->kind:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Segment{fieldPath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->fieldPath:Lcom/google/firebase/firestore/model/FieldPath;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", kind="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/firebase/firestore/model/AutoValue_FieldIndex_Segment;->kind:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
