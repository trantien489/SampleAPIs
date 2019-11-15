import React, { Component } from "react";
import key from '../../i18n/key';
import { Button, Label, Card, CardBody, CardFooter, CardHeader, Form, FormGroup, FormFeedback, Input, Row, Col } from "reactstrap";
import DateTimePicker from 'react-datetime-picker';
import Parser from 'html-react-parser';
import { formatString, formatDateTimeToString, convertUTCDateToLocalDate, cloneObject } from '../../utilities/format';
import { isEmptyOrSpace, validateEmail } from '../../utilities/validate';
import { ControlType } from '../../contants/ControlType';
import { handleParameter, handleErrorBasic } from '../../utilities/handler';
import { commonConstant } from '../../contants/common';
import { reactSelectCustomStyles, reactSelectFormatOptions, reactSelectInputChange, reactSelectGetCurrentValue } from '../../utilities/reactSelect';
import { toastr } from 'react-redux-toastr';
import { AppSwitch } from '@coreui/react';
import Select from 'react-select';
var _inputs = [];

var _currentAction = null;export class AddOrEdit extends Component {
    constructor(props) {
        super(props);
        let modelFromFields = props.fields.reduce((arr, item) => ({ ...arr, [item.Name]: item.Value }), {});
        this.state = {
            errors: {},
            initModel: cloneObject(modelFromFields),
            model: cloneObject(modelFromFields),
        };
        this.handleChangeFields = this.handleChangeFields.bind(this);
    }

    checkDuplicate = [];

    componentDidMount() {
        if (_inputs[0]) _inputs[0].focus();
        const { match } = this.props;
        if (handleParameter(match) !== commonConstant.ParamAdd) {
            const strQuery = '?id=' + handleParameter(match);
            this.props.getByIdAction(strQuery);
        }
    }
    handleSubmitForm = (event) => {
        if (!event) return;
        event.preventDefault();
        if (!this.handleValidation()) return;
        const { model } = this.state;
        // Xử lý input, convert from local time to UTC time to save db
        let fields = this.props.fields;
        let dateTimeFields = fields.filter(item => { return item.Type === ControlType.DateTime && !item.IsDefaultField; });
        dateTimeFields.forEach(item => {
            model[item.Name] = (new Date(model[item.Name])).toISOString();
        });
        this.addOrEditAction(model);
    }
    handleBackList = () => {
        const { history } = this.props;
        if (history) {
            history.goBack();
        }
    }
    handleValidation() {
        const { t, keyFields, fields } = this.props;
        const { model } = this.state;
        let isValidForm = true, errors = {};
        let isfocus = false;
        //Check validate from fields
        fields.map((field, index) => {
            if (field.Required) {
                if (
                    (field.Type === ControlType.ReactSelect && model[field.Name] === '')
                    ||
                    (field.Type === ControlType.ReactSelectMultiple && model[field.Name].length === 0)
                    ||
                    isEmptyOrSpace(model[field.Name])
                ) {
                    isValidForm = false;
                    errors[field.Name] = formatString(t(key.common.fieldCanNotEmptyErrorMsg), t(keyFields[field.Name]));
                    if (_inputs[index] && !isfocus) { isfocus = true; _inputs[index].focus() };
                }
            }
            return true;
        });
        this.setState({ errors: errors });
        return isValidForm;
    }
    handleChangeFields(event, field) {
        const { t, fields } = this.props;
        const { model, errors } = this.state;
        let fieldInfo = fields.find(item => item.Name === field);
        if (!event) { return }
        else if (fieldInfo && (fieldInfo.Type === ControlType.ReactSelect || fieldInfo.Type === ControlType.ReactSelectAsync) && event.value >= 0) {
            model[field] = event.value;
        }
        else if (fieldInfo && fieldInfo.Type === ControlType.ReactSelectMultiple) {
            model[field] = event.map(item => item.value);
        }
        else if (fieldInfo && fieldInfo.Type === ControlType.DateTime) {
            model[field] = formatDateTimeToString(event);
        }
        else if (event.target && fieldInfo && fieldInfo.Type === ControlType.CheckBox) {
            model[field] = event.target.checked;
        }
        else if (event.target && fieldInfo && fieldInfo.Type === ControlType.Number) {
            model[field] = isNaN(parseInt(event.target.value)) ? 0 : parseInt(event.target.value);
        }
        else { // Any thing else is case input type=text
            model[field] = event.target ? event.target.value : '';
            if (fieldInfo.DuplicateConfig.QueryString) {
                if (model[field] !== fieldInfo.Value) {
                    if (this.checkDuplicate[field]) clearTimeout(this.checkDuplicate[field]);
                    this.checkDuplicate[field] = setTimeout(function () {
                        if (model[field] !== '' && model[field].length > 1) {
                            const strQuery = fieldInfo.DuplicateConfig.QueryString + model[field];
                            this.props.callbackCheckDuplicateAction(field, strQuery);
                        }
                    }.bind(this), 300);
                } else {
                    if (errors[field]) {
                        delete errors[field];
                    }
                }

            }
            // Check Email Validate
            if (fieldInfo.Name === ControlType.Email) {
                if (!validateEmail(model[field])) {
                    errors[field] = formatString(t(key.common.fieldPhoneNumberInvalidErrorMsg), t(key.user.Email));
                } else {
                    if (errors[field]) {
                        let errorEmail = formatString(t(key.common.fieldPhoneNumberInvalidErrorMsg), t(key.user.Email));
                        if (errors[field] === errorEmail) {
                            delete errors[field];
                        }
                    }
                }
            }
        }

        this.setState({
            ...this.state,
            model: model,
            errors: errors
        });
    }
    handleChangeDateTimePickers(field, dateValue) {
        let { model } = this.state;
        model[field] = formatDateTimeToString(dateValue);
        this.setState({
            ...this.state,
            model: model
        });
    }
    addOrEditAction = (model) => {
        const { match } = this.props;
        if (handleParameter(match) === commonConstant.ParamAdd) {
            this.props.addAction(model);
        }
        else {
            this.props.editAction(model);
        }
    }
    requestAction = (nextProps) => {
        let { getByIdModel, addModel, editModel, checkDuplicateModel } = nextProps;
        if (getByIdModel && getByIdModel.isLoading) {
            _currentAction = commonConstant.GET_BY_ID;
            return false;
        }
        if (addModel && addModel.isLoading) {
            _currentAction = commonConstant.ADD;
            return false;
        }
        if (editModel && editModel.isLoading) {
            _currentAction = commonConstant.EDIT;
            return false;
        }
        if (checkDuplicateModel && checkDuplicateModel.isLoading) {
            _currentAction = commonConstant.CHECK_DUPLICATE;
            return false;
        }
    }
    responseAction = (nextProps) => {
        const { t, keyFields, addModel, editModel, getByIdModel, fields } = nextProps;
        const { model } = this.state;
        switch (_currentAction) {
            //ADD
            case (commonConstant.ADD):
                if (!addModel || !addModel.responseData ||
                    handleErrorBasic(addModel.responseData.status, t(keyFields.AddTitle), t)) return;
                const result = addModel.responseData;
                if (result.Success) {
                    toastr.success(t(keyFields.AddTitle), t(key.common.addDataSuccess));
                    this.setState({
                        ...this.state,
                        model: this.state.initModel,
                    });
                } else if (result.Data && result.Data.Code === commonConstant.ERROR_MSG_EXISTED) {
                    toastr.error(t(keyFields.AddTitle), t(keyFields.AddExistErrorMsg));
                } else {
                    toastr.error(t(keyFields.AddTitle), t(key.common.addDataFail));
                }
                break;
            //EDIT
            case (commonConstant.EDIT):
                if (!editModel || !editModel.responseData ||
                    handleErrorBasic(editModel.responseData.status, t(keyFields.EditTitle), t)) return;
                if (editModel.responseData.Success) {
                    fields.forEach(item => {
                        if (item.Type === ControlType.DuplicateText) {
                            item.Value = model[item.Name];
                        }
                    });
                    toastr.success(t(keyFields.EditTitle), t(key.common.editDataSuccess));
                }
                else {
                    toastr.error(t(keyFields.EditTitle), t(key.common.editDataFail));
                }
                break;
            //GETBYID
            case (commonConstant.GET_BY_ID):
                if (!getByIdModel || !getByIdModel.responseData ||
                    handleErrorBasic(getByIdModel.responseData.status, t(keyFields.GetByIdTitle), t)) return;
                if (getByIdModel.responseData.Success) {
                    const { Data } = getByIdModel.responseData;
                    if (Data) {
                        let dateTimeFields = fields.filter(item => { return item.Type === ControlType.DateTime });
                        dateTimeFields.forEach(item => {
                            if (Data[item.Name]) {
                                Data[item.Name] = formatDateTimeToString(convertUTCDateToLocalDate(Data[item.Name]));
                            }
                        });
                        fields.forEach(item => {
                            if (item.Type === ControlType.DuplicateText) {
                                item.Value = Data[item.Name];
                            }
                        });
                        this.setState({
                            ...this.state,
                            model: cloneObject(Data),
                        });
                    }
                } else {
                    toastr.error(t(keyFields.GetByIdTitle), t(key.common.errorGetByIdAPI));
                }
                break;
            //DEFAULT    
            default:
                break;
        }
        _currentAction = null;
    }
    componentWillReceiveProps(nextProps) {
        //request action
        if (this.requestAction(nextProps)) return;
        //response action
        this.responseAction(nextProps);
    }
    render() {
        const { t, keyFields, fields, match } = this.props;
        const { model, errors } = this.state;
        const isCaseAdd = handleParameter(match) === commonConstant.ParamAdd;
        const title = handleParameter(match) === commonConstant.ParamAdd ? t(keyFields.AddTitle) : t(keyFields.EditTitle);
        _inputs = [];
        return (
            <Form onSubmit={this.handleSubmitForm}>
                <Card>
                    <CardHeader>
                        <strong>{title}</strong>
                    </CardHeader>
                    <CardBody>
                        <Row>
                            {
                                fields.map((item, index) => {
                                    let fieldLabel = t(keyFields[item.Name]) ? t(keyFields[item.Name]) : t(key.common[item.Name]);
                                    fieldLabel += item.Required ? ' <sup>*</sup>' : '';
                                    let valueField = (!model || !model[item.Name]) ? '' : model[item.Name];
                                    if (item.Type === ControlType.DateTime && valueField) {
                                        valueField = new Date(valueField);
                                    }
                                    //Handle error more for duplicate
                                    if (item.Type === 'DuplicateText' && valueField !== '' && valueField !== item.Value) {
                                        if (item.Name === ControlType.Email) {
                                            let errorDuplicate = formatString(t(key.common.fieldCanNotDuplicateMsg), t(key.user.Email));
                                            if (!errors[item.Name] || errors[item.Name] === errorDuplicate) {
                                                errors[item.Name] = item.DuplicateConfig.ErrorMessage ? item.DuplicateConfig.ErrorMessage : null;
                                            }
                                        } else {
                                            errors[item.Name] = item.DuplicateConfig.ErrorMessage ? item.DuplicateConfig.ErrorMessage : null;
                                        }
                                    }
                                    let invalidField = errors[item.Name] ? true : null;
                                    let validField = !errors[item.Name] && valueField !== '' && valueField !== item.Value? true : null;
                                    const isHideField = !(item.IsDefaultField && isCaseAdd);
                                    return (<React.Fragment key={index}>{
                                        isHideField && item.Type &&
                                        <Col md="6">
                                            <FormGroup>
                                                <Label htmlFor={item.Name}>{Parser(fieldLabel)}</Label>
                                                {(item.Type === ControlType.Text || item.Type === ControlType.Password || item.Type === ControlType.Number) &&
                                                    <Input id={item.Name} name={item.Name} type={item.Type}
                                                        value={valueField} invalid={invalidField}
                                                        innerRef={(self) => { if (self) _inputs.push(self); }}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        readOnly={item.IsReadOnly}
                                                    />
                                                }
                                                {item.Type === ControlType.DuplicateText &&
                                                    <Input id={item.Name} name={item.Name} type="text"
                                                        value={valueField} invalid={invalidField} valid={validField}
                                                        innerRef={(self) => { if (self) _inputs.push(self); }}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        readOnly={item.IsReadOnly}
                                                    />
                                                }
                                                {item.Type === ControlType.Select && item.SelectConfig &&
                                                    <Input id={item.Name} name={item.Name} type={item.Type}
                                                        value={valueField}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        invalid={invalidField}>
                                                        {item.SelectConfig.map(item => <option key={item.Id} value={item.Id}>{t(key.common[item.KeyName])}</option>)}
                                                    </Input>
                                                }
                                                {item.Type === ControlType.DateTime &&
                                                    <DateTimePicker id={item.Name} name={item.Name}
                                                        innerRef={(self) => { if (self) _inputs.push(self); }}
                                                        value={valueField}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        className={(item.IsReadOnly ? 'is-readonly' : (errors[item.Name] ? 'is-invalid' : '')) + ' form-control'}
                                                        readOnly={item.IsReadOnly}
                                                    />
                                                }
                                                {
                                                    item.Type === ControlType.CheckBox &&
                                                    <AppSwitch className={'mx-1 custom-checkbox'} variant={'pill'} color={'primary'} outline={'alt'} size='sm'
                                                        checked={model[item.Name]}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                    />
                                                }
                                                {
                                                    item.Type === ControlType.ReactSelect && reactSelectFormatOptions(item, model, t) &&
                                                    <Select
                                                        className="basic-single"
                                                        classNamePrefix="select"
                                                        styles={reactSelectCustomStyles(errors[item.Name] ? false : true)}
                                                        options={item.SelectConfig.options}
                                                        value={reactSelectGetCurrentValue(item.SelectConfig.options, model[item.Name])}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        placeholder={t(key.common.pleaseSelect) + '...'}
                                                    />
                                                }
                                                {
                                                    item.Type === ControlType.ReactSelectMultiple && item.SelectConfig && item.SelectConfig.options &&
                                                    <Select
                                                        isMulti
                                                        defaultValue={item.SelectConfig.options.filter(i => model[item.Name].indexOf(i.value) > -1)}
                                                        styles={reactSelectCustomStyles(errors[item.Name] ? false : true)}
                                                        options={item.SelectConfig.options}
                                                        className="basic-multi-select"
                                                        classNamePrefix="select"
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        placeholder={t(key.common.pleaseSelect) + '...'}
                                                    />
                                                }
                                                {
                                                    item.Type === ControlType.ReactSelectAsync && item.SelectConfig &&
                                                    <Select
                                                        className="basic-single"
                                                        classNamePrefix="select"
                                                        styles={reactSelectCustomStyles(errors[item.Name] ? false : true)}
                                                        options={item.SelectConfig.options}

                                                        //value={item.SelectConfig.options.find(option => option.value === (model[item.Name] !== '' ? model[item.Name] : -1))}

                                                        onInputChange={(text, action) => reactSelectInputChange(text, action, item.SelectConfig.OnInputChangeCallback, this)}
                                                        isLoading={item.SelectConfig.isLoading}
                                                        filterOption={false}
                                                        onChange={(event) => this.handleChangeFields(event, item.Name)}
                                                        placeholder={t(key.common.pleaseSearch) + '...'}
                                                    />
                                                }
                                                <FormFeedback className={item.Type === ControlType.ReactSelect || item.Type === ControlType.ReactSelectMultiple || item.Type === ControlType.ReactSelectAsync ? 'react-select' : ''}>
                                                    {errors[item.Name]}
                                                </FormFeedback>
                                            </FormGroup>
                                        </Col>
                                    }</React.Fragment>);
                                })
                            }
                        </Row>
                    </CardBody>
                    <CardFooter>
                        <Button type="submit" size="sm" color="primary">
                            <i className="fa fa-dot-circle-o"></i> {t(key.common.btnSubmit)}
                        </Button>{' '}
                        <Button type="reset" size="sm" color="danger" onClick={this.handleBackList}>
                            <i className="fa fa-ban"></i> {t(key.common.btnBackList)}
                        </Button>
                    </CardFooter>
                </Card>
            </Form>
        );
    }
}