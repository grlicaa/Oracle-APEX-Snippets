/*Check if the start date is the same as or after the end date */

const dateFormat = apex.locale.getDateFormat();
let startDateStr = apex.item('P_ITEM_START_DATE').getValue();
let endDateStr = apex.item('P_ITEM_END_DATE').getValue();
let startDate = apex.date.parse(startDateStr, dateFormat);
let endDate = apex.date.parse(endDateStr, dateFormat);


apex.message.clearErrors("P_ITEM_END_DATE");

if (apex.date.isSameOrAfter(startDate, endDate, apex.date.UNIT.DAY)) {
    // Display an error message if the condition is true
    apex.message.showErrors([
        {
            type: "error",
            location: ["inline"],
            pageItem: "P_ITEM_END_DATE",
            message: "End Date must be greater than Start Date"
        }
    ]);
}