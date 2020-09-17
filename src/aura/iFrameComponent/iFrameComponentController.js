({
    doInit: function(component, event, helper) {
        const action = component.get("c.getRecord");
        action.setParams({
            "recordId": component.get("v.recordId")
        });
        action.setCallback(this, function(data) {
            component.set("v.Exercises", data.getReturnValue());
        });
        $A.enqueueAction(action);
    },

    handleClick : function (cmp, event, helper) {
        const link = event.getSource().get("v.name");
        window.open(link,'popup','width=600,height=600');
    }
});
