package model;

import common.enums.TypeName;

public class TypeQuestion {
    int typeID;
    TypeName typeName;

    public TypeQuestion() {
    }

    public TypeQuestion(int typeID, TypeName typeName) {
        this.typeID = typeID;
        this.typeName = typeName;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public TypeName getTypeName() {
        return typeName;
    }

    public void setTypeName(TypeName typeName) {
        this.typeName = typeName;
    }
}
