using ProcessorService as service from '../../srv/processor-service';
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value :  customer.name,
                Label : '{i18n>Customer}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Overview',
            ID : 'Overview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    ID : 'GeneratedFacet1',
                    Label : 'General Information',
                    Target : '@UI.FieldGroup#GeneratedGroup',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Details}',
                    ID : 'i18nDetails',
                    Target : '@UI.FieldGroup#i18nDetails',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Conversations}',
            ID : 'i18nConversations',
            Target : 'conversations/@UI.LineItem#i18nConversations',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
     
        {
            $Type : 'UI.DataField',
            Value : status.descr,
            Label : '{i18n>Status}',
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : urgency.descr,
            Label : '{i18n>Urgency}',
        },

    ],
    UI.SelectionFields : [
        status_code,
        urgency_code
        

    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : customer.name,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.FieldGroup #i18nDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status.descr,
                Label : '{i18n>Status}',
            },
            {
                $Type : 'UI.DataField',
                Value : urgency.descr,
                Label : '{i18n>Urgency}',
            },
        ],
    },
);



annotate service.Incidents with {
    status @(
        Common.Label : '{i18n>Status}',
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Incidents with {
    urgency @(
        Common.Label : '{i18n>Urgency}',
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Status with {
    code @Common.Text : descr
};

annotate service.Urgency with {
    code @Common.Text : descr
};

annotate service.Status with {
    descr @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Status',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Urgency with {
    descr @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Urgency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Conversations with @(
    UI.LineItem #i18nConversations : [
        {
            $Type : 'UI.DataField',
            Value : incidents.conversations.author,
            Label : 'author',
        },
        {
            $Type : 'UI.DataField',
            Value : incidents.conversations.message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : incidents.conversations.timestamp,
            Label : 'timestamp',
        },
    ]
);



annotate service.Customers with {
     name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Incidents with {
    title @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : title,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

